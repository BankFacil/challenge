from src.factory.product_type_strategy import ProductTypeStrategyFactory
from src.model.order import Order
from src.model.payment import Payment
from src.model.payment_method import PaymentMethod


class OrderService:
    def __init__(self):
        self.__product_type_strategy_factory = ProductTypeStrategyFactory()

    def process(self, order: Order, payment_method: PaymentMethod):
        payment = Payment(order=order, payment_method=payment_method)
        payment.pay()

        for item in payment.order.items:
            self.__product_type_strategy_factory.create(item).execute()

        return payment.order
