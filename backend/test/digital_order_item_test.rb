require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class DigitalOrderItemTest < Minitest::Test
    attr_reader :customer, :digital_product, :order, :digital_item, :mailer

    def setup
      @customer = Customer.new('king_size@bol.com.br')
      @digital_product = Product.new('Test Driven Development: By Example', 'digital')
      @order = Order.new(@customer)
      @mailer = MiniTest::Mock.new
      @digital_item = DigitalOrderItem.new(@order, @digital_product, @mailer)
    end

    def test_should_add_voucher_when_purchase_digital_item
      @mailer.expect(:send_mail, true, [String, String])
      @digital_item.close
      
      assert(digital_item.vouchers.count == 1)
      assert(digital_item.discount_value == 10)
    end

    def test_should_subtract_total_when_purchase_digital_item
      @mailer.expect(:send_mail, true, [String, String])
      @digital_item.close

      assert(digital_item.total == 90)
    end
  end
end
