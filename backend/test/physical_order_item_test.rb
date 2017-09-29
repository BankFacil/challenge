require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class PhysicalOrderItemTest < Minitest::Test
    def test_shipping_label_when_physical_item
      customer = Customer.new('king_size@bol.com.br')
      physical_product = Product.new('Macbook Pro', 'physical')
      order = Order.new(customer)

      shipping_label = MiniTest::Mock.new
      shipping_label.expect(:send_label, true, ['Deverá ser transportado para a caixa de envio'])

      physical_item = PhysicalOrderItem.new(order, physical_product, shipping_label)
      physical_item.close
    end
  end
end
