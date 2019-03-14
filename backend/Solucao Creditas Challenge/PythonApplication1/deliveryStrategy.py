from customer import Address
from customer import Customer
from sendEmail import SendEmail


class BookType():
    def __init__(self, name, Customer):
        self.name = name
        print("\nClient: " + Customer.customerName)
        print("Address: " + Customer.shippingAddress)
        print("Zipcode: " + Customer.zipCodeShipping)
        print("Product: " + self.name)
        print("This product it is a tax-exempt item as provided in the Constitution Art. 150, VI, d.\n" )


class PhysicalType:
    def __init__(self,name, Customer):
        self.name = name
        print("\nClient: " + Customer.customerName )
        print("Address: " + Customer.shippingAddress)
        print("Zipcode: " + Customer.zipCodeShipping)
        print("Product: " + self.name)
        print("Label: Physical Product\n")
      
class DigitalType:
    def __init__(self,name, Customer):
        self.name = name
        msg = """\nDear %s,
                Your purchase, %s, is now avaliable for download on bellow link.
                Thanks for choose us!
                http://www.tgxdigital.com/download23233.html\n""" % (Customer.customerName, self.name)
        
        print(msg)
        
        #SendEmail(Customer.emailCustomer,msg)


class Membership:
    def __init__(self, name, Customer):
        self.name = name
        msg = """\nDear %s,
                Your purchase, %s, has been actived in your account!
                We're sending you a $10,0 voucher for your next purchase! 
                Thanks for choose us!\n"""  % (Customer.customerName, self.name)
        print(msg)
        
        #SendEmail(Customer.emailCustomer,msg)

        