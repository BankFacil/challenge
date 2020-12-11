import abc

from src.command.order_item import OrderItemProcessor, ShipLabelCommand, EmailCommand, SubscriptionCommand, \
    DiscountCommand
from src.model.order import OrderItem
from src.model.product import ProductType


class ProductTypeStrategy(abc.ABC):
    def __init__(self, order_item: OrderItem):
        self.order_item = order_item

    @abc.abstractmethod
    def execute(self):
        pass


class ProductPhysicalStrategy(ProductTypeStrategy):
    def execute(self):
        OrderItemProcessor(self.order_item).add(ShipLabelCommand()).process()


class ProductBookStrategy(ProductTypeStrategy):
    def execute(self):
        OrderItemProcessor(self.order_item).add(ShipLabelCommand('Notification')).process()


class ProductDigitalStrategy(ProductTypeStrategy):
    def execute(self):
        OrderItemProcessor(self.order_item).add(EmailCommand()).process()


class ProductMembershipStrategy(ProductTypeStrategy):
    def execute(self):
        OrderItemProcessor(self.order_item) \
            .add(SubscriptionCommand()) \
            .add(EmailCommand()) \
            .add(DiscountCommand()) \
            .process()


class ProductTypeStrategyFactory:
    @staticmethod
    def create(order_item: OrderItem):
        types = {
            ProductType.PHYSICAL: ProductPhysicalStrategy(order_item),
            ProductType.BOOK: ProductBookStrategy(order_item),
            ProductType.DIGITAL: ProductDigitalStrategy(order_item),
            ProductType.MEMBERSHIP: ProductMembershipStrategy(order_item)
        }
        strategy = types.get(order_item.product.product_type, None)

        if strategy is None:
            raise Exception('Invalid Product Type: {}'.format(order_item.product.product_type))

        return strategy
