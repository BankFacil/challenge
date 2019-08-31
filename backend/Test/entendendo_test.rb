require 'test/unit'
require_relative '../lib/customer'
require_relative '../lib/order'
require_relative '../lib/product'
require_relative '../lib/payment'
require_relative '../lib/credit_card'

class EntendendoTest < Test::Unit::TestCase

  def setup
  end
  def teardown
  end


  def test_order_total_amount
    customer = Customer.new(name:'Creditas')
    product = Product.new(name:'Camisa', type:'physical')
    order = Order.new(customer)
    order.add_product(product)

    order.total_amount
    assert_equal(10 , order.total_amount())
  end

  def test_payment_pay
    customer = Customer.new(name:'Creditas')
    product = Product.new(name:'Camisa', type:'physical')
    order = Order.new(customer)
    order.add_product(product)

    payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
    payment.pay()

    puts payment.paid_at
  end
end