#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import time

from log import logger
from errors import *
from . import service as srv
from entity import entity as ett


class Payment(object):
	"""Class with the core that makes the payment.
	Takes as a parameter a class repository and a dictionary as a parameter.
	"""
	authorizationNumber = None
	amount = None
	invoice = None
	order = None
	paymentMethod = None
	paidAt = None

	def __init__(self, repo, data={}):
		self.repo = repo
		self.data = data
		self.authorizationNumber = data.get('attributes', None)
		self.amount = data.get('amount', None)
		self.invoice = data.get('invoice', None)
		self.order = data.get('order', None)
		self.paymentMethod = data.get('payment_method', None)

	def pay(self, paidAt=time.time()):
		try:
			resp = {}
			self.amount = self.order.totalAmount
			self.authorizationNumber = int(time.time())
			attributes = dict(
				billing_address=self.order.address,
				shipping_address=self.order.address,
				order=self.order
			)
			self.invoice = ett.Invoice(attributes=attributes)
			self.paidAt = paidAt
			self.order.close(self.paidAt)

			if not self.__isPaid():
				raise paymentStatusError

			resp["is_paid"] = True
			rules = Rules(self.repo, self.order)
			resp["messages"] = rules.proccess()

		except Exception as e:
			err = wrapError(paymentNotMadeError, e)
			err = setErrorContext(err, "params", str(self.data))
			raise err

		else:
			return resp

	def __isPaid(self):
		return self.paidAt != None


class Rules(object):
	"""The class applies as postpay rules for notifications, subscription activation and tag generation.
	Takes the repository and order class as a parameter.
	"""
	order = None
	service = None
	memberships = None
	shippingLabels = None
	taxExemptions = None
	vouchers = None

	def __init__(self, repo, order):
		self.repo = repo
		self.order = order
		self.service = srv.Service()
		self.memberships = ett.ProductGrouper(self.order.customer)
		self.shippingLabels = ett.ProductGrouper(self.order.customer)
		self.taxExemptions = ett.ProductGrouper(self.order.customer)
		self.vouchers = ett.ProductGrouper(self.order.customer)

	def proccess(self):
		try:
			resp = {}
			self.__grouping()

			if len(self.memberships) > 0:
				self.repo.setMembership(self.memberships)
				resp["memberships"] = self.service.activeMembershipNotification(self.memberships)

			if len(self.shippingLabels) > 0:
				resp["shippingLabels"] = self.service.generateShippingLabel(self.shippingLabels)

			if len(self.taxExemptions) > 0:
				resp["taxExemptions"] = self.service.taxExemptionNotification(self.taxExemptions)

			if len(self.vouchers) > 0:
				resp["vouchers"] = self.service.sendDiscountVoucher(self.vouchers)

		except Exception as e:
			err = wrapError(failedPostpayProcessError, e)
			err = setErrorContext(err, "customer", str(self.order.customer))
			err = setErrorContext(err, "items", [str(obj) for obj in self.order.items])
			logger.error(err)
			resp = str(err.message)

		finally:
			return resp

	def __grouping(self):
		for item in self.order.items:
			self.CATEGORY.get(item.product.category, self.__caseDefault)(self, item.product)

	def	__setMembershipNotification(self, product):
		self.memberships.products = product

	def __setShippingLabel(self, product):
		self.shippingLabels.products = product
		if product.kind == "book":
			self.__setTaxExemptionNotification(product)

	def __setDiscountVoucher(self, product):
		self.vouchers.products = product
		if product.kind == "book":
			self.__setTaxExemptionNotification(product)

	CATEGORY = {
		"digital": __setDiscountVoucher,
		"physical": __setShippingLabel,
		"membership": __setMembershipNotification,
	}

	def __caseDefault(self, product):
		err = setErrorContext(invalidProductCodeCategory, "category:", product.category)
		logger.warning(err)

	def __setTaxExemptionNotification(self, product):
		self.taxExemptions.products = product
