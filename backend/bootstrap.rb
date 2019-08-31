require_relative 'lib/customer'
require_relative 'lib/product'
require_relative 'lib/order'
require_relative 'lib/payment'
require_relative 'lib/credit_card'
require_relative 'lib/shipping_label'

# Book Example (build new payments if you need to properly test it)
foolano = Customer.new(name:'Creditas')
book = Product.new(name: 'Awesome book', type: :book)
book_order = Order.new(foolano)
book_order.add_product(book)

payment_book = Payment.new(order: book_order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
payment_book.pay
p payment_book.paid? # < true
p payment_book.order.items.first.product.type

# now, how to deal with shipping rules then?
shippingLabel = ShippingLabel.new(order:book_order)
p shippingLabel.print()