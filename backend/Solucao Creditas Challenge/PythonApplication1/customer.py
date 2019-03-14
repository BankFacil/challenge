class Membership:
    discountFlag = False
    membershipID = None 
    discount = 0.0

    def  __init__(self,customerAttr) :
        self.membershipID = customerAttr.get("numberID")
        self.discountFlag = customerAttr.get("discountFlag")
        if self.discountFlag == True:
            self.discount = 10.0
        if self.discountFlag == False:
            self.discount = 0.0

class Address:
    zipCodeBilling = None
    billingAddress = None
    zipCodeShipping = None
    shippingAddress = None

    def __init__(self,customerAttr ):
        self.zipCodeBilling = customerAttr.get("zipCodeBilling")
        self.billingAddress = customerAttr.get("billingAddress")
        self.zipCodeShipping = customerAttr.get("zipCodeShipping")
        self.shippingAddress = customerAttr.get("shippingAddress")

class CreditCard:

    @staticmethod
    def fetch_by_hashed(code):
        return CreditCard()

class Customer(Address,Membership, CreditCard):
    customerName = None
    numberID = None
    emailCustomer = None
    creditCard = None

    def __init__(self, customerAttr = None):
        Address.__init__(self,customerAttr)
        Membership.__init__(self,customerAttr)
        self.customerName = customerAttr.get("customerName")
        self.numberID = customerAttr.get("numberID")
        self.emailCustomer = customerAttr.get("emailCustomer") 
        self.creditCard = customerAttr.get("creditCard")
    
 # you can customize this class by yourself