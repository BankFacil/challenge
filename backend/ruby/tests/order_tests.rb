require 'test/unit'
require_relative '../domain/customer'
require_relative '../domain/credit_card'
require_relative '../domain/order'
require_relative '../domain/product'

class OrderTests <  Test::Unit::TestCase
    DATE_FORMAT = '%F %T'
    
    def setup
        @customer = Customer.new 'gimoteco@gmail.com'
        @payment_method = CreditCard.fetch_by_hashed '123'
        @product = Product.new("Harry Potter", "book")
    end

    def test_should_pay_an_order
        order = Order.new(@customer)
        expected_date = Time.now.strftime(DATE_FORMAT)
        order.add_product(@product)

        order.pay @payment_method

        assert_true order.is_paid?
        assert_equal expected_date, order.payment.paid_at.strftime(DATE_FORMAT)
    end

    def test_that_should_close_the_order_after_payment
        order = Order.new(@customer)
        expected_date = Time.now.strftime(DATE_FORMAT)
        order.add_product(@product)

        order.pay @payment_method

        assert_true order.is_closed?
        assert_equal expected_date, order.closed_at.strftime(DATE_FORMAT) 
    end

    def test_order_without_items_should_raise_exception
        order = Order.new(@customer)

        assert_raise_message 'No items ordered' do
            order.pay @payment_method
        end  
    end

    def test_should_register_the_payment
        order = Order.new(@customer)
        order.add_product(@product)

        order.pay @payment_method

        assert_not_nil order.payment
        assert_instance_of(Payment, order.payment)
    end
end