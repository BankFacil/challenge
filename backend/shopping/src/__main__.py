from src.model.customer import Customer, Address
from src.model.order import Order
from src.model.payment_method import CreditCard
from src.model.product import Product, ProductType
from src.service.order import OrderService

if __name__ == '__main__':
    book = Product(name='Awesome book', price=15.0, product_type=ProductType.MEMBERSHIP)

    customer = Customer(nome='Fulano', address=Address(zipcode='45678-979', street='Street', city='City'))

    book_order = Order(customer=customer)
    book_order.add_product(book, 2)

    OrderService().process(book_order, CreditCard().fetch_by_hash('43567890-987654367'))
