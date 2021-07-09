require_relative "../shipping_label"

class PostPhysicalItemSoldAction
    def initialize(printer)
        @printer = printer
    end

    def execute(item, order)
        @printer.print("#{item.product.name} - Ship to: #{order.address}")
        order.ship_to ShippingLabel.new(order.shipping_address)
    end
end