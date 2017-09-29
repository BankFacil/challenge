module OnlineInvoice
  class Order
    attr_reader :customer, :items, :payment, :address, :closed_at

    def initialize(customer, overrides = {})
      @customer = customer
      @items = []
      @order_item_class = overrides.fetch(:item_class) { OrderItem }
      @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
    end

    def add_product(product)
      order_item_type_factory = OrderItemTypeFactory.new(self, product)
      order_item = order_item_type_factory.get_order_item_by_type
      @items.push(order_item) 
    end

    def total_amount
      @items.map(&:total).inject(:+)
    end

    def close(closed_at = Time.now)
      @closed_at = closed_at
      @items.map(&:close)
    end
  end
end
