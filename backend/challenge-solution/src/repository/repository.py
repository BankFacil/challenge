#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

from log import logger
from errors import *
from entity import entity as ett


class Repository(object):
	"""Class responsible for providing access to the database."""
	db = None

	def __init__(self):
		self.db = Database()

	def getCustomerById(self, key):
		if self.db.customers.get(key) == None:
			raise setErrorContext(customerNotFoundError, "customer", key)

		return self.db.customers[key]

	def getProductById(self, key):
		if self.db.produtcs.get(key) == None:
			raise setErrorContext(productNotFoundError, "product", key)

		return self.db.produtcs[key]

	def setMembership(self, memberships):
		ctm = self.getCustomerById(memberships.customer.key)
		ctm.memberships = memberships.products

	def getMembership(self, customer):
		ctm = self.getCustomerById(customer)
		if len(ctm.memberships) == 0:
			return "This customer has no active memberships."

		return [str(v) for k, v in ctm.memberships.items()]


class Database(object):
	"""Simulate a dummy database."""
	customers = None
	produtcs = None

	def __init__(self):
		self.customers = self.__loadCustomers()
		self.produtcs = self.__loadProducts()
		logger.debug("dados do mock carregados.")

	def __loadCustomers(self):
		customers = {
			1: ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111"),
			2: ett.Customer(key=2, name="Maria Soares", email="maria.soares@gmail.com", cpf="22222222222"),
			3: ett.Customer(key=3, name="Fernanda Costa", email="fernanda.costa@gmail.com", cpf="33333333333"),
			4: ett.Customer(key=4, name="Carlos Moreira", email="carlos.moreira@gmail.com", cpf="44444444444"),
			5: ett.Customer(key=5, name="Aline Siqueira", email="aline.siqueira@gmail.com", cpf="55555555555")
		}
		return customers

	def __loadProducts(self):
		produtcs = {
			1: ett.Product(key=1, description="Lápis", value=1.00, category="physical"),
			2: ett.Product(key=2, description="Caneta", value=2.00, category="physical"),
			3: ett.Product(key=3, description="Lapiseira", value=1.50, category="physical"),
			4: ett.Product(key=4, description="Música", value=5.99, category="digital"),
			5: ett.Product(key=5, description="Álbum", value=30.00, category="digital"),
			6: ett.Product(key=6, description="Livro", value=7.99, category="digital", kind="book"),
			7: ett.Product(key=7, description="Dvd", value=20.00, category="physical"),
			8: ett.Product(key=8, description="Livro 1", value=25.00, category="physical", kind="book"),
			9: ett.Product(key=9, description="Livro 2", value=50.00, category="physical", kind="book"),
			10: ett.Product(key=10, description="Netflix", value=39.50, category="membership"),
			11: ett.Product(key=11, description="Amazon Prime", value=49.50, category="membership"),
			12: ett.Product(key=12, description="Disney Plus", value=59.50, category="membership")
		}
		return produtcs
