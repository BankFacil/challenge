#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import pytest

from errors import *
from . import helper as hp
from repository import repository as rps
from entity import entity as ett


repo = rps.Repository()
hlp = hp.Helper(repo)


# CUSTOMER

def test_validate_customer_null_fail():
	with pytest.raises(Error, match=str(invalidCustomerCodeError)):
		hlp.validateCustomer(None)

def test_validate_customer_empty_fail():
	with pytest.raises(Error, match=str(invalidCustomerCodeError)):
		hlp.validateCustomer({"customer": ""})

def test_validate_customer_negative_value_fail():
	with pytest.raises(Error, match=str(invalidCustomerCodeError)):
		hlp.validateCustomer({"customer": -1})

def test_validate_customer_word_fail():
	with pytest.raises(Error, match=str(invalidCustomerCodeError)):
		hlp.validateCustomer({"customer": "João"})

def test_validate_customer_digit_string_success():
	resp = hlp.validateCustomer({"customer": "1"})
	assert resp == None

def test_validate_customer_digit_success():
	resp = hlp.validateCustomer({"customer": 1})
	assert resp == None


# PRODUCT

def test_validate_product_null_fail():
	params = {
		"customer": 1,
		"products": None,
		"creditcard": "43567890-987654367"
	}
	with pytest.raises(Error, match=str(invalidProductCodeError)):
		hlp.validate(params)

def test_validate_product_empty_fail():
	params = {
		"customer": 1,
		"products": "",
		"creditcard": "43567890-987654367"
	}
	with pytest.raises(Error, match=str(invalidProductCodeError)):
		hlp.validate(params)

def test_validate_product_type_not_list_fail():
	params = {
		"customer": 1,
		"products": 1,
		"creditcard": "43567890-987654367"
	}
	with pytest.raises(Error, match=str(invalidProductCodeError)):
		hlp.validate(params)

def test_validate_product_negative_value_fail():
	params = {
		"customer": 1,
		"products": [-1],
		"creditcard": "43567890-987654367"
	}
	with pytest.raises(Error, match=str(invalidProductCodeError)):
		hlp.validate(params)

def test_validate_product_list_with_word_fail():
	params = {
		"customer": 1,
		"products": [1, "caneta", 3],
		"creditcard": "43567890-987654367"
	}
	with pytest.raises(Error, match=str(invalidProductCodeError)):
		hlp.validate(params)

def test_validate_product_list_with_digit_string_success():
	params = {
		"customer": 1,
		"products": [1, "2", 3],
		"creditcard": "43567890-987654367"
	}
	resp = hlp.validate(params)
	assert isinstance(resp, dict)

def test_validate_product_list_with_digit_success():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": "43567890-987654367"
	}
	resp = hlp.validate(params)
	assert isinstance(resp, dict)


# CREDITCARD

def test_validate_creditcard_null_fail():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": None
	}
	with pytest.raises(Error, match=str(invalidPaymentDataError)):
		hlp.validate(params)

def test_validate_creditcard_empty_fail():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": ""
	}
	with pytest.raises(Error, match=str(invalidPaymentDataError)):
		hlp.validate(params)

def test_validate_creditcard_digit_fail():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": 43567890987654367
	}
	with pytest.raises(Error, match=str(invalidPaymentDataError)):
		hlp.validate(params)

def test_validate_creditcard_digit_fail():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": "43567890-987654367"
	}
	resp = hlp.validate(params)
	assert isinstance(resp, dict)


# ALL PARAMS

def test_validate_all_params_null_fail():
	with pytest.raises(Error, match=str(invalidParametersError)):
		hlp.validate(None)

def test_validate_all_params_sucess():
	params = {
		"customer": 1,
		"products": [1, 2, 3],
		"creditcard": "43567890-987654367"
	}
	resp = hlp.validate(params)
	assert isinstance(resp.get("order"), ett.Order)
	assert isinstance(resp.get("payment_method"), ett.CreditCard)
