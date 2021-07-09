require 'test/unit'
require_relative '../domain/customer'
require_relative '../domain/product'

class CustomerTests <  Test::Unit::TestCase
    MAIL = 'gimoteco@gmail.com'

    def test_customer_should_begin_with_no_memberships
        customer = Customer.new MAIL

        assert_true customer.memberships.empty?
    end

    def test_should_add_a_membership
        customer = Customer.new MAIL
        membership = Product.new "Premium account", "membership"
        
        customer.add_a_membership(membership)

        assert_equal 1, customer.memberships.length
        assert_true customer.memberships[0].activated
        assert_equal customer.memberships[0].product, membership

    end

    def test_customer_should_begin_with_no_vouchers
        customer = Customer.new MAIL
        
        assert_true customer.vouchers.empty?
    end

    def test_customer_should_record_the_voucher
        customer = Customer.new MAIL
        amount = 10

        customer.give_a_voucher_of(amount)
        
        assert_equal 1, customer.vouchers.length
        assert_equal amount, customer.vouchers[0].value
    end
end