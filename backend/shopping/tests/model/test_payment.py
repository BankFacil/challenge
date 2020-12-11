import time
from unittest import TestCase

from src.model.customer import Customer, Address
from src.model.order import Order
from src.model.payment import Payment
from src.model.payment_method import CreditCard
from src.model.product import Product, ProductType


class TestPayment(TestCase):
    def test_pay(self):
        now = time.time()
        customer = Customer(nome='Fulano', address=Address(zipcode='45678-979', street='Street', city='City'))

        order = Order(customer)
        order.add_product(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        payment = Payment(order=order, payment_method=CreditCard().fetch_by_hash('12345657890'))
        payment.pay()

        self.assertIsNotNone(payment)
        self.assertIsNotNone(payment.order)
        self.assertIsNotNone(payment.paid_at)
        self.assertGreaterEqual(now, payment.paid_at)
        self.assertIsNotNone(payment.authorization_number)
        self.assertEqual(payment.amount, order.total_amount())
        self.assertIsNotNone(payment.invoice)
