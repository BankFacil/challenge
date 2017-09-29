require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class BookOrderItemTest < Minitest::Test
    def test_should_send_shipping_label_when_purchase_book_item
      customer = Customer.new('king_size@bol.com.br')
      book = Product.new('Working Effectively with Legacy Code', 'book')
      order = Order.new(customer)

      shipping_label = MiniTest::Mock.new
      shipping_label.expect(:send_label, true, ['Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.'])

      book_item = BookOrderItem.new(order, book, shipping_label)
      book_item.close
    end
  end
end
