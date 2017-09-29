require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class BootstrapTest < Minitest::Test
    # test to assure that the legacy code is still working
    def test_original_bootstrap
      foolano = Customer.new('king_size@bol.com.br')
      book = Product.new('Awesome book', 'book')
      book_order = Order.new(foolano)
      book_order.add_product(book)

      payment_book = Payment.new(
        order: book_order,
        payment_method: CreditCard.fetch_by_hashed('43567890-987654367')
      )
      payment_book.pay
      assert(payment_book.paid? == true) # < true
      assert(payment_book.order.items.first.product.type == 'book')
      # now, how to deal with shipping rules then?
    end
  end
end
