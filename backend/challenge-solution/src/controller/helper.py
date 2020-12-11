#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

from log import logger
from errors import *
from entity import entity as ett


class Helper(object):
	"""Class responsible for validating the request parameters before sending them to the use cases."""
	repo = None

	def __init__(self, repository):
		self.repo = repository

	def validate(self, params):
		try:
			self.validateCustomer(params)
			self.__validateProducts(params)
			self.__validateCreditCard(params)
			data = self.__prepare(params)

		except Exception as e:
			raise wrapError(invalidParametersError, e)

		else:
			return data

	def validateCustomer(self, params):
		if not isinstance(params, dict):
			raise invalidCustomerCodeError

		if not str(params.get("customer")).isdigit():
			raise invalidCustomerCodeError

		return None

	def __validateProducts(self, params):
		if not params.get("products"):
			raise invalidProductCodeError

		if not isinstance(params["products"], list):
			raise invalidProductCodeError

		if False in [str(key).isdigit() for key in params["products"]]:
			raise invalidProductCodeError

		return None

	def __validateCreditCard(self, params):
		if not params.get("creditcard"):
			raise invalidPaymentDataError

		if not isinstance(params["creditcard"], str):
			raise invalidPaymentDataError

		return None

	def __prepare(self, params):
		customer = self.repo.getCustomerById(int(params["customer"]))

		order = ett.Order(customer)
		for key in params["products"]:
			product = self.repo.getProductById(int(key))
			order.addProduct(product)

		data = dict(
			order = order,
			payment_method = ett.CreditCard.fetchByHashed(params["creditcard"])
		)
		return data
