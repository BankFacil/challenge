from unittest import TestCase

from src.model.order import Order, OrderItem
from src.model.product import Product, ProductType


class TestOrder(TestCase):
    def test_add_product(self):
        order = Order()
        order.add_product(Product(name='Product 1', price=10.0, product_type=ProductType.DIGITAL), 1)
        order.add_product(Product(name='Product 2', price=11.0, product_type=ProductType.BOOK), 1)
        order.add_product(Product(name='Product 3', price=12.0, product_type=ProductType.PHYSICAL), 1)

        self.assertEqual(len(order.items), 3)

    def test_total_amount(self):
        order = Order()
        order.add_product(Product(name='Product 1', price=10, product_type=ProductType.DIGITAL), quantity=2)
        order.add_product(Product(name='Product 2', price=15, product_type=ProductType.DIGITAL), quantity=2)

        total = order.total_amount()

        self.assertEqual(total, 50)

    def test_close(self):
        order = Order()

        self.assertIsNone(order.closed_at)

        order.close()

        self.assertIsNotNone(order.closed_at)

    def test_total(self):
        item = OrderItem(Product(name='Product 1', price=10.0, product_type=ProductType.DIGITAL), 2)

        self.assertEqual(item.total(), 20)
