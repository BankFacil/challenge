require 'test/unit'
require 'mocha/test_unit'

require_relative '../domain/product'
require_relative '../domain/post_payment_actions/post_physical_item_sold_action'
require_relative './order_builder'

class PostPhysicalItemSoldActionTests <  Test::Unit::TestCase
    def test_should_print_the_shipping_label_from_order_address
        broom = Product.new "Broom", "physical_item"
        printer = mock()
        order = OrderBuilder.new().with_product(broom).paid().create()
        item = order.items[0]
        expected_printed_message = "#{item.product.name} - Ship to: #{order.address}"
        printer.expects(:print).with(expected_printed_message)

        PostPhysicalItemSoldAction.new(printer).execute(item, order)
        
        assert_equal order.address, order.shipping_label.shipping_address
        assert_nil order.shipping_label.tax_information
    end
end