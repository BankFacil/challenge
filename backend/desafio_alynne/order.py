
from address import Address
from customer import Customer
from product import Product
import time

class Order:

    customer = Customer

    items = [Product]

    deliveryAddress = Address

    closed_at = None

 

    def __init__(self, customer,deliveryAddress ):

        self.customer = customer

        self.items = [Product]

        self.deliveryAddress = Address(deliveryAddress)

 

    def add_product(self, product):
        
        self.items.append(product)

 

    def total_amount(self):

        total = 0

        for x in range(1, len(self.items)):
          total += self.items[x].value


        return total 

    def close(self, closed_at=time.time()):

        self.closed_at = closed_at

    def send_orders(self):
      # mais de um tipo d eproduto pode está associado ao mesmo produto
      for x in range(1, len(self.items)):
          print(self.items[x].productType)
          self.items[x].envia()
