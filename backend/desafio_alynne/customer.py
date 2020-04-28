from membership import Membership
from address import Address
import datetime


class Customer:

    name = None

    cpf = None 

    billingAddress = Address

    membership = Membership

    def __init__(self, attributes):

        self.name = attributes.get('name')

        self.cpf = attributes.get('name')

        self.billingAddress = Address(attributes.get('billingAddress'))

        if(attributes.get('membership') != None):
       
          self.membership = Membership(attributes.get('membership'))
    
    def is_memberShip(self):
      if (self.membership):
        return True
      else:
        return False

    def is_valid_memberShip(self):
      if (self.is_memberShip()):
        if(self.membership.expiration_date >= datetime.datetime.now()):
          return True
        else:
          return False
       
