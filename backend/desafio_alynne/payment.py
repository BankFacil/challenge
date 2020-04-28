from order import Order
from invoice import Invoice
import time
import datetime



class Payment:
    authorization_number = None
    amount = None
    invoice = None
    order = None
    payment_method = None
    paid_at = None

    def __init__(self, attributes={}):
     
        self.authorization_number = attributes.get('authorization_number',None)
        self.order = attributes.get('order', None)
        order_amount = self.order.total_amount()

        # afiliados tem desconto sempre
        if (self.order.customer.is_valid_memberShip()):
          discount = order_amount * self.order.customer.membership.discount_value
          self.amount = order_amount - discount
        else:
          self.amount = order_amount
          self.invoice = attributes.get('invoice', None)
       
        self.payment_method = attributes.get('payment_method', None)

    def pay(self ,shipping_address, paid_at=time.time()):
        self.authorization_number = int(time.time())
        attributes = dict(
            shipping_address = shipping_address,
          
        )
        self.invoice = Invoice(attributes=attributes)
        self.paid_at = paid_at
        self.order.close(self.paid_at)

    def is_paid(self):
        return self.paid_at != None