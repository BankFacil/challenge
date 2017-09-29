require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class OrderTest < Minitest::Test
    attr_reader :payment

    def setup
      customer = Customer.new('king_size@bol.com.br')

      product_membership = Product.new('Clean Coders', 'membership')
      product_book = Product.new('Working Effectively with Legacy Code', 'book')
      product_digital = Product.new('Test Driven Development: By Example', 'digital')
      product_physical = Product.new('Macbook Pro', 'physical')

      order = Order.new(customer)
      order.add_product(product_book)
      order.add_product(product_digital)
      order.add_product(product_physical)
      order.add_product(product_membership)

      @payment = Payment.new(
        order: order,
        payment_method: CreditCard.fetch_by_hashed('43567890-987654367')
      )
    end

    def test_count_items_when_products_are_added
      assert(@payment.order.items.count == 4)
    end

    def test_close_items_when_close_order
      assert(@payment.order.items.all? { |item| item.closed? == false})      
      @payment.pay
      assert(@payment.order.items.all? { |item| item.closed? == true})
    end
  end
end
