import smtplib
from customer import Customer

class SendEmail:
    
    msg = None
    toCustumer = None

    def __init__(self, toCustumer, msg):

        
        print("""smtp = smtplib.SMTP_SSL('smtp.gmail.com', 465)

        smtp.login('pedrotostes88@gmail.com', '*********')

        self.fromSeller = "pedrotostes88@gmail.com"
        self.toCustomer = Customer.emailCustomer
        self.msg = msg

        smtp.sendmail(self.fromSeller, self.toCustomer , self.msg)

        smtp.quit()""")