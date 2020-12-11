#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import time, json, datetime


CUSTOMER_FORMAT = "{}: {}."
PRODUCT_FORMAT = "{}: {}. Category: {}. Value: {}."
PRODUCT_GROUPER_FORMAT = "Customer: {} - Products: {}."
MEMBERSHIP_FORMAT = "Activation: {} - Product: {}"

class Customer:
	"""Class that instantiates a customer object. It receives a key, name, email and cpf as a parameter."""
	def __init__(self, key, name, email, cpf):
		self.key = key
		self.name = name
		self.email = email
		self.cpf = cpf
		self._memberships = {}

	def __str__(self):
		return CUSTOMER_FORMAT.format(self.key, self.name)

	@property
	def memberships(self):
		return self._memberships

	@memberships.setter
	def memberships(self, products):
		for prd in products:
			self._memberships[prd.key] = Membership(prd)


class Membership:
	"""Class that instantiates a membership object. It receives a product as a parameter."""
	def __init__(self, product):
		self.__activation = datetime.datetime.now()
		self._product = product

	def __str__(self):
		return MEMBERSHIP_FORMAT.format(self.__activation.strftime("%b %d %Y %H:%M:%S"),
			str(self._product))

	@property
	def activation(self):
		return self.__activation

	@property
	def product(self):
		return self._product


class CreditCard:
	"""Class that instantiates a creditcard object. It receives a hash as a parameter."""
	@staticmethod
	def fetchByHashed(code):
		return CreditCard()


class Product():
	"""Class that instantiates a product object.
	It receives a key, description, value, category and kind(optional) as a parameter.
	"""
	key = None
	description = None
	value = None
	category = None
	kind = None

	def __init__(self, key, description, value, category, kind="other"):
		self.key = key
		self.description = description
		self.value = value
		self.category = category
		self.kind = kind

	def __str__(self):
		return PRODUCT_FORMAT.format(self.key, self.description, self.category, self.value)


class Order:
	"""Class that instantiates a order object.
	It receives a customer and dict as a parameter.
	"""
	customer = None
	items = None
	payment = None
	address = None
	closedAt = None

	def __init__(self, customer, attributes={}):
		self.customer = customer
		self.items = []
		self.orderItemClass = attributes.get('order_item_class', OrderItem)
		self.address = attributes.get('address', Address(zipcode='45678-979'))

	def addProduct(self, product):
		self.items.append(self.orderItemClass(order=self, product=product))

	def totalAmount(self):
		total = 0
		for item in items:
			total += item.total

		return total

	def close(self, closedAt=time.time()):
		self.closedAt = closedAt


class OrderItem:
	"""Class that instantiates a orderitem object.
	It receives a order and product as a parameter.
	"""
	order = None
	product = None

	def __init__(self, order, product):
		self.order = order
		self.product = product

	def total(self):
		return 10

	def __str__(self):
		return str(self.product)


class Address:
	zipcode = None

	def __init__(self, zipcode):
		self.zipcode = zipcode


class Invoice:
	billing_address = None
	shipping_address = None
	order = None

	def __init__(self, attributes={}):
		self.billing_address = attributes.get('billing_address', None)
		self.shipping_address = attributes.get('shipping_address', None)
		self.order = attributes.get('order', None)


class ProductGrouper:
	"""Class that instantiates a productgrouper object.
	It receives a customer as a parameter.
	"""
	def __init__(self, customer):
		self._customer = customer
		self._products = []

	def __str__(self):
		return PRODUCT_GROUPER_FORMAT.format(self._customer, [str(obj) for obj in self._products])

	def __len__(self):
		return len(self._products)

	@property
	def customer(self):
		return self._customer

	@property
	def products(self):
		return self._products

	@products.setter
	def products(self, product):
		self._products.append(product)


class Response:
	"""Class that instantiates a response object.
	It receives a code(default=200) and status(default="OK") as a parameter.
	"""
	def __init__(self, code=200, status="OK"):
		self.header = ResponseHeader(code, status)
		self.body = ResponseBody()

class ResponseHeader:
	"""Class that instantiates a responseheader object.
	It receives a code(default=200) and status(default="OK") as a parameter.
	"""
	def __init__(self, code=200, status="OK"):
		self.code = code
		self.status = status
		self.detail = None

class ResponseBody:
	"""Class that instantiates a responsebody object."""
	def __init__(self):
		self.status = None
		self.content = None


def serialize(obj):
	if isinstance(obj, datetime.datetime):
		return obj.__str__()

	if hasattr(obj, "__dict__"):
		obj = obj.__dict__

	if isinstance(obj, dict):
		return { k:serialize(v) for k,v in obj.items() }

	if isinstance(obj, list) or isinstance(obj, tuple):
		return [serialize(e) for e in obj]

	return obj
