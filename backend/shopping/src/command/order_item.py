import abc

from src.model.order import OrderItem


class OrderItemCommand(abc.ABC):
    @abc.abstractmethod
    def process(self):
        pass


class ShipLabelCommand(OrderItemCommand):
    def __init__(self, notification: str = ''):
        self.notification = notification

    def process(self):
        print('Shipped Label')


class EmailCommand(OrderItemCommand):
    def process(self):
        print('E-mail sent')


class DiscountCommand(OrderItemCommand):
    def process(self):
        print('Discount')


class SubscriptionCommand(OrderItemCommand):
    def process(self):
        print('Subscription active')


class OrderItemProcessor:
    def __init__(self, order_item: OrderItem):
        self.order_item = order_item
        self.__queue = []

    def add(self, command: OrderItemCommand):
        self.__queue.append(command)
        return self

    def process(self):
        for command in self.__queue:
            command.process()

        self.__queue = []
