#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

from log import logger
from errors import *


MESSAGE_ACTIVE_MEMBERSHIP = """Congratulations {}!
	Your subscription is activated for the products described below.
	Products:"""
MESSAGE_SHIPPING_LABEL = """Generation of shipping label for the products described below.
	Products:"""
MESSAGE_TAX_EXEMPTION = """Hello {}!
	The products listed below are tax exempt as provided for in the Constitution Article. 150, VI, d.
	Products:"""
MESSAGE_DISCOUNT_VOUCHER = """Congratulations {}!
	By purchasing the products described below, you are receiving these discount coupon (s) for your next purchase.
	Products:"""

MESSAGE_FAIL = "FAIL"

class Service(object):
	"""This class only simulates the effectiveness of the rules,
	which could be access to external services such
	as sending e-mails for notification and tag generator."""

	def	activeMembershipNotification(self, data):
		try:
			msg = self.__buildMessage(MESSAGE_ACTIVE_MEMBERSHIP, data)

		except Exception as e:
			err = wrapError(activeMembershipError, e)
			logger.error(setErrorContext(err, "data", str(data)))
			# TODO: Failure treatment here.
			return MESSAGE_FAIL

		else:
			return msg

	def generateShippingLabel(self, data):
		try:
			msg = self.__buildMessage(MESSAGE_SHIPPING_LABEL, data)

		except Exception as e:
			err = wrapError(shippingLabelError, e)
			logger.error(setErrorContext(err, "data", str(data)))
			# TODO: Failure treatment here.
			return MESSAGE_FAIL

		else:
			return msg

	def taxExemptionNotification(self, data):
		try:
			msg = self.__buildMessage(MESSAGE_TAX_EXEMPTION, data)

		except Exception as e:
			err = wrapError(taxExemptionError, e)
			logger.error(setErrorContext(err, "data", str(data)))
			# TODO: Failure treatment here.
			return MESSAGE_FAIL

		else:
			return msg

	def sendDiscountVoucher(self, data):
		try:
			msg = self.__buildMessage(MESSAGE_DISCOUNT_VOUCHER, data)

		except Exception as e:
			err = wrapError(discountVoucherError, e)
			logger.error(setErrorContext(err, "data", str(data)))
			# TODO: Failure treatment here.
			return MESSAGE_FAIL

		else:
			return msg

	def __buildMessage(self, message, data):
		msg = []
		msg.append(message.format(data.customer.name))
		for prd in data.products:
			msg.append(str(prd))

		return "\n".join(msg)
