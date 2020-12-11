import time
from typing import List

from attr import dataclass

from src.model.customer import Customer
from src.model.payment import Payment
from src.model.product import Product


@dataclass(frozen=True)
class OrderItem:
    product: Product
    quantity: float

    def total(self) -> float:
        return self.product.price * self.quantity


class Order:
    customer: Customer = None
    items: List[OrderItem] = []
    payment: Payment = None
    closed_at: time = None

    def __init__(self, customer: Customer = None):
        self.items = []
        self.customer = customer

    def add_product(self, product: Product, quantity: int):
        self.items.append(OrderItem(product=product, quantity=quantity))

    def total_amount(self) -> float:
        total = 0

        for item in self.items:
            total += item.total()

        return total

    def close(self, closed_at=time.time()):
        self.closed_at = closed_at
