import unittest
from bootstrap import Customer
from bootstrap import Order
from bootstrap import Product
from bootstrap import CreditCard
from bootstrap import Payment

customer_info = {
    'name': 'Eduardo Herrera',
    'email': 'some@gmail.com',
}

foolano = Customer(customer_info)

# products
book = Product(name='Awesome book', type='book', value=7855)
subscription = Product(
    name='Awesome subscription', type='subscription', value=9999)
pencil = Product(name='Awesome physical product', type='physical', value=20)
membership = Product(name='Awesome membership', type='membership', value=200)
digital = Product(name='Awesome digital product', type='digital', value=50)

# order
order = Order(foolano)

# adding items
order.add_product(book)
order.add_product(subscription)
order.add_product(pencil)
order.add_product(membership)
order.add_product(digital)

attributes = dict(
    order=order,
    payment_method=CreditCard.fetch_by_hashed('43567890-987654367')
)
payment_order = Payment(attributes=attributes)
payment_order.pay()


class customer_tests(unittest.TestCase):

    def test_create_customer(self):

        self.assertEqual("Eduardo Herrera", foolano.name)


class order_test(unittest.TestCase):

    def test_total_order(self):

        self.assertEqual(18124, order.total_amount())

    def test_all_items_added(self):

        self.assertEqual(5, len(order.items))


class payment_test(unittest.TestCase):

    def test_if_is_paid(self):
        self.assertTrue(payment_order.is_paid())

    def test_shipping_box_labels(self):
        self.assertEqual(2, len(order.shipping_box))

    def test_first_label_must_be_tax_exmpted(self):
        self.assertEqual(
            'Label for Awesome book, this item is tax-exempt',
            order.shipping_box[0])


unittest.main()
