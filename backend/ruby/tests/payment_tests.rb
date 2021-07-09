require 'test/unit'
require_relative '../domain/customer'
require_relative '../domain/payment'
require_relative '../domain/credit_card'
require_relative '../domain/order'
require_relative '../domain/invoice'
require_relative '../domain/product'

class PaymentTests <  Test::Unit::TestCase
    def test_that_payment_should_generate_the_invoice_using_the_address_in_order
        payment_method = CreditCard.fetch_by_hashed '123'
        customer = Customer.new 'gimoteco@gmail.com'
        order = Order.new(customer)
        expected_invoice = Invoice.new(order)

        payment = Payment.new(payment_method, Time.now, order)

        assert_equal order.address, payment.invoice.billing_address
        assert_equal order.address, payment.invoice.shipping_address
    end
end