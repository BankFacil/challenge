import time
from customer import Address
from customer import Customer
from product import Product

class OrderTotal:
    closed_at = None
    items = []
    totalPrice = 0.0
    numOfItems = None
    
    def __init__(self, Customer):
        self.customer = Customer
        self.items = []
        self.numOfItems = None
        self.totalPrice = 0.0

    def putOnCart(self, OrdemItem):
        self.items.append([OrdemItem.order, OrdemItem.productType])
        self.numOfItems = len(self.items)
        self.totalPrice += OrdemItem.price
   
    def close(self, closed_at=time.time()):
        self.closed_at = closed_at
        Product(self.items, self.customer)

    # remember: you can create new methods inside those classes to help you create a better design

class OrderItem():
    order = None
    price = 0.0
  
    def __init__(self, order, productType, price):
        self.order = order
        self.productType = productType
        self.price = price