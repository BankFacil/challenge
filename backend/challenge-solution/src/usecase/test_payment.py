#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import pytest

from errors import *
from repository import repository as rps
from . import payment as pay
from entity import entity as ett

repo = rps.Repository()


# PAYMENT

def test_pay_fail_payment_not_made_error():
	data = {}
	with pytest.raises(Error, match=str(paymentNotMadeError)):
		newPay = pay.Payment(repo, data)
		newPay.pay()

def test_pay_fail_payment_status_error():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=2, description="Caneta", value=2.00, category="physical"))

	data = dict(
		order = order,
		payment_method = ett.CreditCard.fetchByHashed("43567890-987654367")
	)
	with pytest.raises(Error, match=str(paymentStatusError)):
		newPay = pay.Payment(repo, data)
		newPay.pay(None)

def test_pay_success():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=2, description="Caneta", value=2.00, category="physical"))

	data = dict(
		order = order,
		payment_method = ett.CreditCard.fetchByHashed("43567890-987654367")
	)
	newPay = pay.Payment(repo, data)
	resp = newPay.pay()
	assert resp.get("is_paid") == True


# RULES

def test_rules_proccess_fail():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(None)
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp == str(failedPostpayProcessError.message)

def test_rules_active_membership_success():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=11, description="Amazon Prime", value=49.50, category="membership"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") != None
	assert resp.get("shippingLabels") == None
	assert resp.get("taxExemptions") == None
	assert resp.get("vouchers") == None

def test_rules_common_digital_product():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=4, description="Música", value=5.99, category="digital"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") == None
	assert resp.get("shippingLabels") == None
	assert resp.get("taxExemptions") == None
	assert resp.get("vouchers") != None

def test_rules_digital_book():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=6, description="Livro", value=7.99, category="digital", kind="book"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") == None
	assert resp.get("shippingLabels") == None
	assert resp.get("taxExemptions") != None
	assert resp.get("vouchers") != None

def test_rules_common_physical_product():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=2, description="Caneta", value=2.00, category="physical"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") == None
	assert resp.get("shippingLabels") != None
	assert resp.get("taxExemptions") == None
	assert resp.get("vouchers") == None

def test_rules_physical_book():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=8, description="Livro 1", value=25.00, category="physical", kind="book"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") == None
	assert resp.get("shippingLabels") != None
	assert resp.get("taxExemptions") != None
	assert resp.get("vouchers") == None

def test_rules_all_categories():
	customer = ett.Customer(key=1, name="João da Silva", email="joao.silva@gmail.com", cpf="11111111111")
	order = ett.Order(customer)
	order.addProduct(ett.Product(key=11, description="Amazon Prime", value=49.50, category="membership"))
	order.addProduct(ett.Product(key=4, description="Música", value=5.99, category="digital"))
	order.addProduct(ett.Product(key=6, description="Livro", value=7.99, category="digital", kind="book"))
	order.addProduct(ett.Product(key=2, description="Caneta", value=2.00, category="physical"))
	order.addProduct(ett.Product(key=8, description="Livro 1", value=25.00, category="physical", kind="book"))
	rules = pay.Rules(repo, order)
	resp = rules.proccess()
	assert resp.get("memberships") != None
	assert resp.get("shippingLabels") != None
	assert resp.get("taxExemptions") != None
	assert resp.get("vouchers") != None
