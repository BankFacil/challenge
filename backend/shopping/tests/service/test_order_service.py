from unittest import TestCase

from src.model.customer import Customer, Address
from src.model.order import Order
from src.model.payment_method import CreditCard
from src.model.product import Product, ProductType
from src.service.order import OrderService


class TestOrderService(TestCase):
    def test_process(self):
        book = Product(name='Awesome book', price=15.0, product_type=ProductType.MEMBERSHIP)

        customer = Customer(nome='Fulano', address=Address(zipcode='45678-979', street='Street', city='City'))

        book_order = Order(customer)
        book_order.add_product(book, 2)

        credit_card = CreditCard().fetch_by_hash('43567890-987654367')

        order = OrderService().process(book_order, credit_card)

        self.assertIsNotNone(order)
        self.assertIsNotNone(order.payment)
        self.assertEqual(order.payment.payment_method, credit_card)
