require 'test/unit'
require 'mocha/test_unit'

require_relative '../domain/product'
require_relative '../domain/post_payment_actions/post_digital_media_sold_action'
require_relative './order_builder'

class PostDigitalMediaSoldActionTests <  Test::Unit::TestCase
    def test_should_print_the_shipping_label_from_order_address
        a_music = Product.new "Despacito.mp3", "digital_media"
        expected_received_voucher_value = 10
        expected_mail_message = "You purchased a digital media: '#{a_music.name}', you won a #{expected_received_voucher_value}$ voucher"
        mail_sender = mock()
        order = OrderBuilder.new().with_product(a_music).paid().create()
        item = order.items[0]
        mail_sender.expects(:send).with(order.customer.mail, expected_mail_message)

        PostDigitalMediaSoldAction.new(mail_sender).execute(item, order)
        
        assert_equal 1, order.customer.vouchers.length
        assert_false order.customer.vouchers[0].used?
    end
end