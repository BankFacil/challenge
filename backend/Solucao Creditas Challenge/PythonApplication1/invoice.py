from order import OrderTotal
from customer import Customer

class Invoice:
    billing_address = None
    shipping_address = None
    order = None
    total = None

    def __init__(self, Customer, OrderTotal, amountFinal):
    
        self.billing_address = Customer.zipCodeBilling
        self.shipping_address = Customer.zipCodeShipping
        self.order = OrderTotal.items
        self.total = amountFinal