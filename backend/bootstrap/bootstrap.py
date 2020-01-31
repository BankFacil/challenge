from utils.sample_data import *
import datetime
import logging
logging.basicConfig(level=logging.INFO)


class Payment:
    def __init__(self, attributes={}):
        self.authorization_number = attributes.get('authorization_number', None)
        self.amount = attributes.get('amount', None)
        self.invoice = attributes.get('invoice', None)
        self.order = attributes.get('order', None)
        self.payment_method = attributes.get('payment_method', None)
        self.paid_at = None

    def pay(self):
        self.amount = self.order.total_amount()
        self.invoice = Invoice(self.order)
        self.paid_at = datetime.datetime.now()
        self.order.close(self.paid_at)
        self.check_out()

    def is_paid(self):
        return self.paid_at is not None

    def check_out(self):
        try:
            if self.is_paid():
                items = self.order.items
                for item in items:
                    Dispatcher.dispatch(item.product, self.order.customer, self.authorization_number)
            else:
                raise ValueError
        except ValueError:
            logging.error('Order has not been paid. Check-out cannot proceed.')


class Dispatcher:
    @staticmethod
    def dispatch(product: object, customer: object, payment_id: datetime):
        if product.category == 'book' or product.category == 'item':
            Dispatcher.generate_label(product.category, customer)
        elif product.category == 'subscription':
            product.active = True
            Dispatcher.send_subscription_notification(product, customer)
        elif product.category == 'media':
            Dispatcher.send_media_notification(product, customer)
            Dispatcher.generate_discount_voucher(customer, payment_id)

    @staticmethod
    def generate_label(category: str, customer: object):
        if category == 'book':
            notification = '----Tax-exempt item as provided in the Constitution Art. 150, VI, d.----\n '
        else:
            notification = ''

        label = "{}{} {} \n {}".format(notification, customer.name, customer.surname, customer.shipping_address)
        logging.info("Generating label for {}... \n".format(category))
        logging.info("{}".format(label))

    @staticmethod
    def send_subscription_notification(product: object, customer: object):
        logging.info('Sending subscription email notification...')
        notification = ('''
        Dear {} {},
        Your subscription for {} has been activated on {} and will be available until {}
        '''.format(customer.name, customer.surname, product.name, product.activation_date, product.expiration_date))
        logging.info(notification)
        logging.info('Email sent. \n')

    @staticmethod
    def send_media_notification(product: object, customer: object):
        logging.info('Sending description email...')
        notification = ('''
        Dear {} {},
        You acquired the {} {} on {}.
        Your purchase is available in 'My content' section within your account.  
        '''.format(customer.name, customer.surname, product.media_type, product.name,
                   product.activation_date, product.expiration_date))
        logging.info(notification)
        logging.info('Email sent. \n')

    @staticmethod
    def generate_discount_voucher(customer: object, payment_id: datetime):
        customer.voucher[payment_id] = {}
        customer.voucher[payment_id]['active'] = True
        customer.voucher[payment_id]['value'] = 10


class Invoice:
    def __init__(self, order: object):
        self.billing_address = order.customer.billing_address
        self.shipping_address = order.customer.shipping_address
        self.order = order


class Order:
    def __init__(self, customer: object):
        self.customer = customer
        self.items = []
        self.closed_at = None

    def add_product(self, product):
        self.items.append(OrderItem(product=product))

    def total_amount(self):
        total = 0
        for item in self.items:
            total += item.total()
        return total

    def close(self, time_closed):
        self.closed_at = time_closed


class OrderItem:
    def __init__(self, product):
        self.product = product

    def total(self):
        return 10


class Product:
    def __init__(self, name: str, category: str):
        self.name = name
        self.category = category


class Book(Product):
    pass


class Item(Product):
    pass


class Subscription(Product):
    def __init__(self, name, category, plan):
        super().__init__(name, category)
        self.active = False
        self.activation_date = datetime.datetime.today()
        self.expiration_date = self.activation_date.replace(year=self.activation_date.year + 1)
        self.membership = Membership(plan)


class Media(Product):
    def __init__(self, name, category, media_type):
        super().__init__(name, category)
        self.media_type = media_type
        self.activation_date = datetime.datetime.today()
        self.expiration_date = self.activation_date.replace(year=self.activation_date.year + 1)


class Address:
    def __init__(self, address: {}):
        self.address = address
        self.street = address['street']
        self.zipcode = address['zipcode']
        self.city = address['city']
        self.country = address['country']

    def __str__(self):
        return '{} \n {} - {}, {}'.format(self.street, self.zipcode, self.city, self.country)


class CreditCard:
    @staticmethod
    def fetch_by_hashed(code):
        return CreditCard()


class Customer:
    def __init__(self, data: {}):
        self.name = data['name']
        self.email = data['email']
        self.surname = data['surname']
        self.shipping_address = Address(data['shipping_address'])
        self.billing_address = Address(data['billing_address'])
        self.voucher = {}


class Membership:
    def __init__(self, plan):
        self.plan = plan


if __name__ == '__main__':
    foolano = Customer(HOMER_SIMPSON)

    book = Book(name='Awesome book', category='book')
    socks = Item(name='Happy socks', category='item')
    spotify = Subscription(name='Spotify', category='subscription', plan='standard')
    netflix = Subscription(name='Spotify', category='subscription', plan='premium')
    movie = Media(name='Despicable me', category='media', media_type='movie')
    mp3 = Media(name='Nabucco Overture', category='media', media_type='mp3')

    order = Order(foolano)
    order.add_product(book)
    order.add_product(socks)
    order.add_product(spotify)
    order.add_product(movie)
    order.add_product(mp3)

    attributes = dict(
        authorization_number=datetime.datetime.now(),
        order=order,
        payment_method=CreditCard.fetch_by_hashed('43567890-987654367'),
    )
    payment = Payment(attributes=attributes)
    payment.pay()
