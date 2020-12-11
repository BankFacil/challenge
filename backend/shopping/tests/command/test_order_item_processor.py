from unittest import TestCase
from unittest.mock import MagicMock

from src.command.order_item import EmailCommand, OrderItemProcessor, ShipLabelCommand, DiscountCommand, \
    SubscriptionCommand
from src.model.order import OrderItem
from src.model.product import ProductType, Product


class TestOrderItemProcessor(TestCase):

    def test_process_multiple(self):
        email = EmailCommand()
        email.process = MagicMock()

        discount = DiscountCommand()
        discount.process = MagicMock()

        ship_label = ShipLabelCommand()
        ship_label.process = MagicMock()

        subscription = SubscriptionCommand()
        subscription.process = MagicMock()

        order_item = OrderItem(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        OrderItemProcessor(order_item) \
            .add(email) \
            .add(ship_label) \
            .add(discount) \
            .add(subscription) \
            .process()

        email.process.assert_called_with()
        ship_label.process.assert_called_with()
        discount.process.assert_called_with()
        subscription.process.assert_called_with()

    def test_process_ship_label(self):
        ship_label = ShipLabelCommand()
        ship_label.process = MagicMock()

        order_item = OrderItem(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        OrderItemProcessor(order_item).add(ship_label).process()

        ship_label.process.assert_called_with()

    def test_process_email(self):
        email = EmailCommand()
        email.process = MagicMock()

        order_item = OrderItem(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        OrderItemProcessor(order_item).add(email).process()

        email.process.assert_called_with()

    def test_process_discount(self):
        discount = DiscountCommand()
        discount.process = MagicMock()

        order_item = OrderItem(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        OrderItemProcessor(order_item).add(discount).process()

        discount.process.assert_called_with()

    def test_process_subscription(self):
        subscription = SubscriptionCommand()
        subscription.process = MagicMock()

        order_item = OrderItem(product=Product(name='Book', price=10, product_type=ProductType.BOOK), quantity=1)

        OrderItemProcessor(order_item).add(subscription).process()

        subscription.process.assert_called_with()
