#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import json, copy


ERROR_NO_CODE = 0
ERROR_FORMAT = "{}: {}"
CAUSE_FORMAT = " Cause: {}"
CONTEXT_FORMAT = " Context: {}"

class Error(Exception):
	"""Class that instantiates a exception error object.
	It receives a code and message as a parameter.
	"""
	def __init__(self, code, message):
		self._code = code
		self._message = message
		self._context = []
		self._cause = None

	def __str__(self):
		return ERROR_FORMAT.format(self._code, self._message) + \
			(CAUSE_FORMAT.format(self._cause) \
			if self._cause != None else "") + \
			(CONTEXT_FORMAT.format(json.dumps([obj.__dict__ for obj in self._context])) \
			if len(self._context) > 0 else "")

	@property
	def code(self):
		return self._code

	@property
	def message(self):
		return self._message

	@property
	def context(self):
		return json.dumps([obj.__dict__ for obj in self._context])

	@property
	def cause(self):
		return self._cause


class ErrorCode():
	"""Class that instantiates a errorcode object.
	Provides an incremental for error codes.
	"""
	def __init__(self, code):
		self.__code = code

	@property
	def code(self):
		self.__code += 1
		return self.__code


class ErrorContext():
	"""Class that instantiates a errorContext object.
	It receives a field and value as a parameter.
	"""
	def __init__(self, field, value):
		self.field = field
		self.value = value


def setErrorContext(originalError, field, value):
	"""Method that generates a new error object and adds context.
	It receives a field and value as a parameter.
	"""
	if (isinstance(originalError, Error)):
		error = copy.deepcopy(originalError)
		error._context = copy.deepcopy(originalError._context)
		error._context.append(ErrorContext(field, value))
		return error

	error = Error(ERROR_NO_CODE, str(originalError))
	error._context.append(ErrorContext(field, value))
	return error


def wrapError(originalError, cause):
	"""Method that wraps an error with the given cause.
	It receives a originalError and cause as a parameter.
	"""
	if (isinstance(originalError, Error)):
		error = copy.deepcopy(originalError)
		error._cause = cause
		return error

	error = Error(ERROR_NO_CODE, str(originalError))
	error._cause = cause
	return error


def unwrapError(error):
	"""Method that unwraps an error returning the cause.
	It receives a error as a parameter.
	"""
	unwrap = error
	while isinstance(unwrap, Error):
		if unwrap.cause == None:
			break

		unwrap = unwrap.cause

	if not isinstance(unwrap, Error):
		return Error(ERROR_NO_CODE, str(error))

	return unwrap


# Error codes in the 4000 range. Errors related to incorrect user actions.
__userError = ErrorCode(4000)
invalidTokenError = Error(__userError.code, "Invalid token.")
invalidParametersError = Error(__userError.code, "Invalid parameters.")
invalidCustomerCodeError = Error(__userError.code, "Invalid customer code.")
invalidProductCodeError = Error(__userError.code, "Invalid product code.")
invalidPaymentDataError = Error(__userError.code, "Invalid payment data.")
emptyCustomerCodeError = Error(__userError.code, "Empty client code.")
emptyProductCodeError = Error(__userError.code, "Empty product code.")
emptyPaymentDataError = Error(__userError.code, "Empty payment data.")
customerNotFoundError = Error(__userError.code, "Customer not found.")
productNotFoundError = Error(__userError.code, "Product not found.")
invalidProductCodeCategory = Error(__userError.code, "invalid product category.")


# Error codes in the 5000 range. Errors related to internal system failures.
__appError = ErrorCode(5000)
startApplicationError = Error(__appError.code, "Failed to start the application.")
failedPaymentError = Error(__appError.code, "Failed payment.")
paymentNotMadeError = Error(__appError.code, "Payment could not be made.")
paymentStatusError = Error(__appError.code, "Payment status false.")
failedPostpayProcessError = Error(__appError.code, "Something failed in postpay processing.")
activeMembershipError = Error(__appError.code, "Subscription activation not performed.")
shippingLabelError = Error(__appError.code, "Shipping label not generated.")
taxExemptionError = Error(__appError.code, "Exemption notification not sent.")
discountVoucherError = Error(__appError.code, "Discount voucher not sent.")
failedGetMembership = Error(__appError.code, "It was not possible to obtain membership data.")
