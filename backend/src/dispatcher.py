from abc import ABC, abstractmethod

class Dispatcher(ABC):

    def__init__(self, product)
        self.product = product

    @abstractmethod
    def end_dispatcher(self, customer):
        pass

class Digital_dispatcher(Dispatcher):

    def end_dispatcher(self, customer):
        self.add_voucher(customer)
        self.send_email(customer)

    def add_voucher(self, customer):
        customer.voucher = 10

    def send_email(self, customer):
        print('Send email to: {}....'.format(customer.email))
        return True

class Membership_dispatcher(Dispatcher):

    def end_dispatcher(self, customer):
        self.subscribe(customer)
        self.send_email(customer)

    def subscribe(self, customer):
        customer.subscriber = True

    def send_email(self, customer):
        print('Send email to: {}....'.format(customer.email))
        return True

class Physical_dispatcher(Dispatcher):

    def end_dispatcher(self, customer):
        if (product.category == book):
            self.shipping_label(customer)
        else:
            self.print_shipping_label(customer)


    def print_shipping_label(self, customer):
        return "{}".format(customer.name)

    def shipping_label(self, customer):
        return "no tax according constitution Art. 150, VI, d.{}".format(customer.name)
