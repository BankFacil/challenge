import time


def send_mail(email, message):
    print(message)
    return True


class Payment:
    authorization_number = None
    amount = None
    invoice = None
    order = None
    payment_method = None
    paid_at = None

    def __init__(self, attributes={}):
        self.order = attributes.get('order', None)
        self.payment_method = attributes.get('payment_method', None)

    def pay(self, paid_at=time.time()):
        self.amount = self.order.total_amount()
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
        return self.paid_at is not None


class Invoice:
    billing_address = None
    shipping_address = None
    order = None

    def __init__(self, attributes={}):
        self.billing_address = attributes.get('billing_address', None)
        self.shipping_address = attributes.get('shipping_address', None)
        self.order = attributes.get('order', None)


class Order:
    customer = None
    items = None
    payment = None
    address = None
    closed_at = None
    shipping_box = []
    product_type_functions = None

    def __init__(self, customer, attributes={}):
        self.customer = customer
        self.items = []
        self.order_item_class = attributes.get('order_item_class', OrderItem)
        self.address = attributes.get('address', Address(zipcode='45678-979'))
        self.product_type_functions = {
            'physical': self.generate_label,
            'book': self.generate_label,
            'subscription': self.activate_subscription,
            'membership': self.activate_membership,
            'digital': self.digital_purchase
        }

    def add_product(self, product):
        self.items.append(self.order_item_class(order=self, product=product))

    def total_amount(self):
        total = 0
        for item in self.items:
            total += item.product.value
        return total

    def close(self, closed_at=time.time()):
        self.closed_at = closed_at
        self.ship()

    def ship(self):
        for item in self.items:
            self.product_type_functions[item.product.type](item.product)

    def generate_label(self, item):
        label = f'Label for {item.name}'
        if item.type == 'book':
            label = f'{label}, this item is tax-exempt'
        self.shipping_box.append(label)

    def activate_subscription(self, item):
        send_mail(
            self.customer.email, f'Subscription Activated for {item.name}')

    def activate_membership(self, item):
        membership = Membership(self.customer, item.name)
        membership.activate()

    def digital_purchase(self, item):
        message = (
            f'Digital purchase for {item.name}, you had alse won this voucher:'
            f' $10 disccount using this code \"asdasd846\"'
        )
        send_mail(self.customer.email, message)


class OrderItem:
    order = None
    product = None

    def __init__(self, order, product):
        self.order = order
        self.product = product

    def total(self):
        return self.product.value

    def __str__(self):
        return self.product.name


class Product:
    # use type to distinguish each kind of product: physical, book, digital,
    # membership, etc.
    name = None
    type = None
    value = None

    def __init__(self, name, type, value):
        self.name = name
        self.type = type
        self.value = value


class Address:
    zipcode = None

    def __init__(self, zipcode):
        self.zipcode = zipcode


class CreditCard:

    @staticmethod
    def fetch_by_hashed(code):
        return CreditCard()


class Customer:
    name = None
    email = None

    def __init__(self, attributes={}):
        self.name = attributes.get('name', None)
        self.email = attributes.get('email', None)


class Membership:
    customer = None
    name = None

    def __init__(self, customer, name):
        self.customer = customer
        self.name = name

    def activate(self):
        send_mail(
            self.customer.email,
            f'This membership, {self.name}, has been activated')
