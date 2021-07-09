require 'test/unit'
require 'mocha/test_unit'

require_relative '../domain/product'
require_relative '../domain/post_payment_actions/post_membership_sold_action'
require_relative './order_builder'

class PostMembershipSoldActionTests <  Test::Unit::TestCase
    def test_should_print_the_shipping_label_from_order_address
        premium_account = Product.new "Premium account", "membership"
        expected_mail_message = "Congrats, your membership '#{premium_account.name}' was activated"
        mail_sender = mock()
        order = OrderBuilder.new().with_product(premium_account).paid().create()
        item = order.items[0]
        mail_sender.expects(:send).with(order.customer.mail, expected_mail_message)

        PostMembershipSoldAction.new(mail_sender).execute(item, order)
        
        assert_equal 1, order.customer.memberships.length
        assert_true order.customer.memberships[0].activated
    end
end