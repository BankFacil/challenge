require 'test/unit'
require 'mocha/test_unit'

require_relative '../domain/product'
require_relative '../domain/post_payment_actions/post_book_sold_action'
require_relative './order_builder'

class PostBookSoldActionTests <  Test::Unit::TestCase
    def test_should_print_the_shipping_label_from_order_address
        a_book = Product.new "Harry Potter", "book"
        tax_info = 'item isento de impostos conforme disposto na Constituição Art. 150, VI, d.'
        printer = mock()
        order = OrderBuilder.new().with_product(a_book).paid().create()
        item = order.items[0]
        expected_printed_message = "#{item.product.name}: #{tax_info} - Ship to: #{order.address}"
        printer.expects(:print).with(expected_printed_message)

        PostBookSoldAction.new(printer).execute(item, order)
        
        assert_equal order.address, order.shipping_label.shipping_address
        assert_equal tax_info, order.shipping_label.tax_information
    end
end