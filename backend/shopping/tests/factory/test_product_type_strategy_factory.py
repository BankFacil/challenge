from unittest import TestCase

from src.factory.product_type_strategy import ProductTypeStrategyFactory, ProductDigitalStrategy, ProductBookStrategy, \
    ProductPhysicalStrategy, ProductMembershipStrategy
from src.model.order import OrderItem
from src.model.product import Product, ProductType


class TestProductTypeStrategyFactory(TestCase):
    def test_create_digital(self):
        order_item = OrderItem(Product(name='Digital', price=1, product_type=ProductType.DIGITAL), quantity=1)

        strategy = ProductTypeStrategyFactory.create(order_item)

        self.assertIsInstance(strategy, ProductDigitalStrategy)

    def test_create_book(self):
        order_item = OrderItem(Product(name='Book', price=1, product_type=ProductType.BOOK), quantity=1)

        strategy = ProductTypeStrategyFactory.create(order_item)

        self.assertIsInstance(strategy, ProductBookStrategy)

    def test_create_physical(self):
        order_item = OrderItem(Product(name='Physical', price=1, product_type=ProductType.PHYSICAL), quantity=1)

        strategy = ProductTypeStrategyFactory.create(order_item)

        self.assertIsInstance(strategy, ProductPhysicalStrategy)

    def test_create_membership(self):
        order_item = OrderItem(Product(name='Membership', price=1, product_type=ProductType.MEMBERSHIP), quantity=1)

        strategy = ProductTypeStrategyFactory.create(order_item)

        self.assertIsInstance(strategy, ProductMembershipStrategy)

    def test_create_invalid_product_type(self):
        order_item = OrderItem(Product(name=None, price=None, product_type=None), quantity=1)

        with self.assertRaises(Exception):
            ProductTypeStrategyFactory.create(order_item)
