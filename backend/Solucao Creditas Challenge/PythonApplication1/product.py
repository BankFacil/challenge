import sys
from deliveryStrategy import BookType
from deliveryStrategy import PhysicalType
from deliveryStrategy import DigitalType
from deliveryStrategy import Membership
from customer import Customer

class SenderOrder:

        def __init__(self, name, type = None, Customer = None):

                if type == "bookType":
                        BookType(name, Customer)
                if type == "physicalType":
                        PhysicalType(name, Customer)
                if type == "digitalType":
                        DigitalType(name, Customer)
                if type == "membershipType":
                        Membership(name, Customer)

class Product:

    name = None
    type = None
    purchaseList = []

    def __init__(self, items, Customer):
        self.purchaseList = items
        for i in range(len(self.purchaseList)):
                name = self.purchaseList[i][0]
                type = self.purchaseList[i][1]
                SenderOrder(name, type, Customer)
