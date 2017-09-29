module OnlineInvoice
  class OrderItemTypeFactory
    attr_reader :types, :product

    def initialize(order, product)
      @product = product
      @types = {
        'physical' => PhysicalOrderItem.new(order, product, ShippingLabel.new),
        'book' => BookOrderItem.new(order, product, ShippingLabel.new),
        'digital' => DigitalOrderItem.new(order, product, Mailer.new),
        'membership' => MembershipOrderItem.new(order, product, MembershipRepository.new, Mailer.new)
      }
    end

    def get_order_item_by_type
      @types[@product.type]
    end
  end
end
