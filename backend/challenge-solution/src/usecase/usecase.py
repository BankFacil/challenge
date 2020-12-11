#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

from log import logger
from errors import *
from . import payment as pay


class UseCase(object):
	"""Class that acts with only one interactor between the controller and the use cases."""
	repo = None

	def __init__(self, repository):
		self.repo = repository

	def payment(self, data):
		try:
			logger.debug("Starting payment...")
			newPay = pay.Payment(self.repo, data)
			result = newPay.pay()

		except Exception as e:
			raise wrapError(failedPaymentError, e)

		else:
			return result

	def membership(self, params):
		try:
			logger.debug("Getting affiliations...")
			result = self.repo.getMembership(int(params.get("customer")))

		except Exception as e:
			raise wrapError(failedGetMembership, e)

		else:
			return result
