import time

from attr import dataclass

from src.model.customer import Invoice
from src.model.payment_method import PaymentMethod


@dataclass
class Payment:
    order: object
    payment_method: PaymentMethod
    authorization_number: int = 0
    amount: float = 0
    invoice: Invoice = None
    paid_at: time = None

    def pay(self, paid_at=time.time()):
        self.amount = self.order.total_amount()
        self.authorization_number = int(time.time())
        self.paid_at = paid_at
        self.order.close(self.paid_at)
        self.order.payment = self

        address = self.order.customer.address

        self.invoice = Invoice(order=self.order, billing_address=address, shipping_address=address)

    def is_paid(self):
        return self.paid_at is not None
