import time

class Payment(object):
    authorization_number = None
    amount = None
    paid_at = None
    payment_method = None
    invoice = None
    order = None

    def __init__(self, attributes={}):
        self.authorization_number = attributes.get('attributes', None)
        self.amount = attributes.get('amount', None)
        self.invoice = attributes.get('invoice', None)
        self.order = attributes.get('order', None)
        self.payment_method = attributes.get('payment_method', None)

    def pay(self, paid_at=time.time()):
        self.amount = self.order.total_amount
        self.authorization_number = int(time.time())
        attributes = dict(
            billing_address=self.order.address,
            shipping_address=self.order.address,
            order=self.order
        )
        self.invoice = Invoice(attributes=attributes)
        self.paid_at = paid_at
        self.order.close(self.paid_at)

    def is_paid(self):
        return self.paid_at != None

class Invoice():
    billing_address = None
    shipping_address = None
    order = None

    def __init__(self, attributes={}):
        self.billing_address = attributes.get('billing_address', None)
        self.shipping_address = attributes.get('shipping_address', None)
        self.order = attributes.get('order', None)

class Order():
    customer = None
    items = None
    payment = None
    address = None
    closed_at = None
    send = None

    def __init__(self, customer, attributes={}):
        self.customer = customer
        self.items = []
        self.order_item_class = attributes.get('order_item_class', OrderItem)
        self.address = attributes.get('address', Address(zipcode='45678-979'))

    def add_product(self, product):
        var = type(product).__name__

        if var == "Physical":
            self.items.append(OrderPhysical(order=self))
        elif var == "Subscription":
            self.items.append(OrderSubscription(order=self))
        elif var == "Book":
            self.items.append(OrderBook(order=self))
        elif var == "Midia":
            self.items.append(OrderMidia(order=self))

    def total_amount(self):
        total = 0
        for item in self.items:
            total += item.total

        return total

    def close(self, closed_at=time.time()):
        self.closed_at = closed_at

        for item in self.items:
            item.send()

    # remember: you can create new methods inside those classes to help you create a better design

class OrderItem():
    order = None
    product = None

    def __init__(self, order, product):
        self.order = order
        self.product = product

    def total(self):
        return 10

class OrderPhysical(OrderItem):

    def __init__(self, order):
        OrderItem.__init__(self, order, Physical("Physical"))

    def send(self):
        ShippingLabel('info').printLabel()

class OrderSubscription(OrderItem):
    def __init__(self, order):
        OrderItem.__init__(self, order, Subscription("Subscription"))

    def send(self):
        Membership(self.order.customer.email).activate()
        Notify('info').send()

class OrderBook(OrderItem):
    def __init__(self, order):
        OrderItem.__init__(self, order, Book("Book"))

    def send(self):
        ShippingLabel('isento de impostos conforme disposto na Constituicao Art. 150, VI, d.').printLabel()

class OrderMidia(OrderItem):
    def __init__(self, order):
        OrderItem.__init__(self, order, Midia("Midia"))

    def send(self):
        # Need to implement sender and reciver message
        Notify('with a voucher').send()

class Product(object):
    # use type to distinguish each kind of product: physical, book, digital, membership, etc.
    name = None
    type = None

    def __init__(self, name, type):
        self.name = name
        self.type = type

class Physical(Product):

    def __init__(self, name):
        Product.__init__(self, name, "Physical")

class Subscription(Product):
    def __init__(self, name):
        Product.__init__(self, name, "Subscription")

class Book(Product):
    def __init__(self, name):
        Product.__init__(self, name, "Book")

class Midia(Product):
    def __init__(self, name):
        Product.__init__(self, name, "Midia")

class Address():
    zipcode = None

    def __init__(self, zipcode):
        self.zipcode = zipcode

class CreditCard():

    @staticmethod
    def fetch_by_hashed(code):
        return CreditCard()


class Customer():
    email = None

    def __init__(self,email):
        self.email = email


class Membership():

    login = None
    active = False

    def __init__(self, login):
        self.login = login

    def activate(self):
        self.active = True
        User.add(self)

class User():

    users = []

    @staticmethod
    def add(account):
        User.users.append(account)


class Notify():

    # Need to implement a email
    message = None

    def __init__ (self, message):
        self.message = message

    def send(self):
        EmailQueue.add(self)


class EmailQueue():

    queue = []

    @staticmethod
    def add(notify):
        EmailQueue.queue.append(notify)

class ShippingLabel():
    # Need to implement a print
    information = None


    def __init__ (self, information):
        self.information = information

    def printLabel(self):
        PrinterQueue.add(self)


class PrinterQueue():

    queue = []

    @staticmethod
    def add(shippingLabel):
        PrinterQueue.queue.append(shippingLabel)


# Book Example (build new payments if you need to properly test it)
# foolano = Customer()
# book = Product(name='Awesome book', type='book')
# book_order = Order(foolano)
# book_order.add_product(book)

# attributes = dict(
#     order=book_order,
#     payment_method=CreditCard.fetch_by_hashed('43567890-987654367')
# )
# payment_book = Payment(attributes=attributes)
# payment_book.pay()
# print(payment_book.is_paid())  # < true
# print(payment_book.order.items[0].product.type)