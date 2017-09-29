require_relative '../lib/bootstrap.rb'

module OnlineInvoice
  class OrderItemTypeFactoryTest < Minitest::Test
    attr_reader :customer, :order

    def setup
      @customer = Customer.new('king_size@bol.com.br')
      @order = Order.new(@customer)
    end

    def test_count_order_item_type_factory
      product = Product.new('Clean Coders', 'membership')
      order_item_type_factory = OrderItemTypeFactory.new(@customer, product)
      assert(order_item_type_factory.types.keys.count == 4)
    end

    def test_get_membership_order_item_type
      product = Product.new('Clean Coders', 'membership')
      order_item_type_factory = OrderItemTypeFactory.new(@customer, product)
      order_item = order_item_type_factory.get_order_item_by_type

      assert_instance_of(MembershipOrderItem, order_item)
    end

    def test_get_book_order_item_type
      product = Product.new('Working Effectively with Legacy Code', 'book')
      order_item_type_factory = OrderItemTypeFactory.new(@customer, product)
      order_item = order_item_type_factory.get_order_item_by_type

      assert_instance_of(BookOrderItem, order_item)
    end

    def test_get_digital_order_item_type
      product = Product.new('Test Driven Development: By Example', 'digital')
      order_item_type_factory = OrderItemTypeFactory.new(@customer, product)
      order_item = order_item_type_factory.get_order_item_by_type
      
      assert_instance_of(DigitalOrderItem, order_item)
    end

    def test_get_physical_order_item_type
      product = Product.new('Macbook Pro', 'physical')
      order_item_type_factory = OrderItemTypeFactory.new(@customer, product)
      order_item = order_item_type_factory.get_order_item_by_type

      assert_instance_of(PhysicalOrderItem, order_item)
    end
  end
end
