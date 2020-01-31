# -*- coding: utf-8 -*-

import datetime
import logging
import random
import unittest
from bootstrap.bootstrap import Customer, Address, Book, Item, Subscription,\
                                Dispatcher, Media, Order, Payment, OrderItem
from utils.sample_data import HOMER_SIMPSON, BOOK, SOCKS, SPOTIFY_SUBSCRIPTION, NETFLIX_SUBSCRIPTION,\
                            HULU_SUBSCRIPTION, MOVIE, TEST_SHIPPING_ADDRESS,\
                            BOOK_LABEL, ITEM_LABEL, LOGGER_HEADER

# logging.disable(logging.INFO)  # Should be enabled when logging tests are fully functional


class TestCustomer(unittest.TestCase):
    def test_create_a_customer(self):
        """
        Test that a customer is properly created
        """
        customer = Customer(HOMER_SIMPSON)
        self.assertEqual(customer.name, HOMER_SIMPSON['name'])
        self.assertEqual(customer.surname, HOMER_SIMPSON['surname'])
        self.assertEqual(customer.email, HOMER_SIMPSON['email'])
        self.assertIsInstance(customer.shipping_address, Address)
        self.assertIsInstance(customer.billing_address, Address)
        self.assertEqual(customer.billing_address.street, TEST_SHIPPING_ADDRESS['street'])
        self.assertEqual(customer.shipping_address.address, TEST_SHIPPING_ADDRESS)


class TestProductTypeBook(unittest.TestCase):
    def setUp(self):
        self.book = Book(name=BOOK['name'], category=BOOK['category'])

    def test_create_a_product_type_book(self):
        """
        Test that a product type book is properly created
        """
        self.assertEqual(self.book.name, BOOK['name'])
        self.assertEqual(self.book.category, BOOK['category'])


class TestProductTypeItem(unittest.TestCase):
    def setUp(self):
        self.product = Item(name=SOCKS['name'], category=SOCKS['category'])

    def test_create_a_product_type_item(self):
        """
        Test that a product type item is properly created
        """
        self.assertEqual(self.product.name, SOCKS['name'])
        self.assertEqual(self.product.category, SOCKS['category'])


class TestProductTypeSubscription(unittest.TestCase):
    def test_create_a_product_type_subscription(self):
        """
        Test that a product type subscription is properly created
        """
        subscription = Subscription(name=SPOTIFY_SUBSCRIPTION['name'],
                                    category=SPOTIFY_SUBSCRIPTION['category'],
                                    plan=SPOTIFY_SUBSCRIPTION['membership_plan'])

        self.assertEqual(subscription.name, SPOTIFY_SUBSCRIPTION['name'])
        self.assertEqual(subscription.category, SPOTIFY_SUBSCRIPTION['category'])
        self.assertEqual(subscription.membership.plan, SPOTIFY_SUBSCRIPTION['membership_plan'])
        self.assertEqual(subscription.active, SPOTIFY_SUBSCRIPTION['active'])

    def test_subscription_activates_after_payment(self):
        """
        Test that subscription is activated after payment
        """
        customer = Customer(HOMER_SIMPSON)
        subscription = Subscription(name=NETFLIX_SUBSCRIPTION['name'],
                                    category=NETFLIX_SUBSCRIPTION['category'],
                                    plan=NETFLIX_SUBSCRIPTION['membership_plan'])

        self.assertEqual(subscription.active, False)
        Dispatcher.dispatch(subscription, customer, payment_id=None)
        self.assertEqual(subscription.active, True)

    def test_expiration_date_is_one_year_after_activation_date(self):
        """
        Test expiration date is set to a year after activation date
        """
        subscription = Subscription(name=HULU_SUBSCRIPTION['name'],
                                    category=HULU_SUBSCRIPTION['category'],
                                    plan=HULU_SUBSCRIPTION['membership_plan'])

        self.assertEqual(subscription.expiration_date,
                         subscription.activation_date.replace(year=subscription.activation_date.year + 1))


class TestProductTypeMedia(unittest.TestCase):
    def test_create_a_product_type_media_movie(self):
        """
        Test that a product type media is properly created
        """
        media = Media(name='Despicable me', category='media', media_type='movie')
        self.assertEqual(media.name, MOVIE['name'])
        self.assertEqual(media.category, MOVIE['category'])
        self.assertEqual(media.media_type, MOVIE['media_type'])

    def test_create_voucher(self):
        """
        Test voucher is created when product is media
        """
        customer = Customer(HOMER_SIMPSON)
        media = Media(name='Nabucco Overture', category='media', media_type='mp3')
        payment_id = datetime.datetime.now()
        Dispatcher.dispatch(media, customer, payment_id)
        self.assertEqual(customer.voucher[payment_id]['active'], True)
        self.assertEqual(customer.voucher[payment_id]['value'], 10)


class TestOrder(unittest.TestCase):
    def setUp(self):
        self.customer = Customer(HOMER_SIMPSON)
        self.order = Order(self.customer)

    def test_order_has_no_items_when_first_time_created(self):
        """
        Test order has no items when created for first time
        """
        self.assertEqual(self.order.items, [])

    def test_add_items_to_order(self):
        """
        Test order has items after them being added
        """
        product = Item(name=SOCKS['name'], category=SOCKS['category'])
        self.order.add_product(product)
        self.assertEqual(len(self.order.items), 1)
        self.assertIsInstance(self.order.items[0], OrderItem)

    def test_order_closed_when_payment_done(self):
        """
        Test order is closed when payment done
        """
        fake_payment_time = datetime.datetime.now()
        payment = Payment(dict(order=self.order, authorization_number=fake_payment_time))
        payment.order.close(fake_payment_time)
        self.assertEqual(self.order.closed_at, fake_payment_time)


class TestPayment(unittest.TestCase):
    def setUp(self):
        self.customer = Customer(HOMER_SIMPSON)
        self.order = Order(self.customer)
        self.payment_time = datetime.datetime.now()

    def test_cannot_check_out_if_payment_not_done(self):
        """
        Test that check out cannot be done unless payment has been done first
        """
        payment = Payment(dict(order=self.order, authorization_number=self.payment_time))
        self.assertRaises(ValueError, payment.check_out())

    def test_checkout_product_type_book(self):
        """
        Test checkout scenario for product type book
        """
        book = Book(name=BOOK['name'], category=BOOK['category'])
        self.order.add_product(book)
        payment = Payment(dict(order=self.order, authorization_number=self.payment_time))
        payment.pay()

        with self.assertLogs(level='INFO') as context_manager:
            logging.getLogger().info(BOOK_LABEL)
        self.assertEqual(context_manager.output, [LOGGER_HEADER + BOOK_LABEL])

    def test_checkout_product_type_item(self):
        """
        Test checkout scenario for product type item
        """
        socks = Item(name=SOCKS['name'], category=SOCKS['category'])
        self.order.add_product(socks)
        payment = Payment(dict(order=self.order, authorization_number=self.payment_time))
        payment.pay()

        with self.assertLogs(level='INFO') as context_manager:
            logging.getLogger().info(ITEM_LABEL)
        self.assertEqual(context_manager.output, [LOGGER_HEADER + ITEM_LABEL])

    def test_checkout_product_type_subscription(self):
        """
        Test checkout scenario for product type subscription
        """
        subscription = Subscription(name=SPOTIFY_SUBSCRIPTION['name'],
                                    category=SPOTIFY_SUBSCRIPTION['category'],
                                    plan=SPOTIFY_SUBSCRIPTION['membership_plan'])
        self.order.add_product(subscription)
        payment = Payment(dict(order=self.order, authorization_number=self.payment_time))
        payment.pay()

        with self.assertLogs(level='INFO') as context_manager:
            logging.getLogger().info(ITEM_LABEL)
        self.assertEqual(context_manager.output, [LOGGER_HEADER + ITEM_LABEL])

    def test_checkout_product_type_media(self):
        """
        Test checkout scenario for product type media
        """
        media = Media(name=MOVIE['name'], category=MOVIE['category'], media_type=MOVIE['media_type'])
        self.order.add_product(media)
        payment = Payment(dict(order=self.order, authorization_number=self.payment_time))
        payment.pay()

        self.assertEqual(self.customer.voucher[self.payment_time]['active'], True)
        self.assertEqual(self.customer.voucher[self.payment_time]['value'], 10)


if __name__ == '__main__':
    unittest.main()
