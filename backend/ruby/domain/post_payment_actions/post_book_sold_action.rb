require_relative "../shipping_label"

class PostBookSoldAction
    def initialize(printer)
        @printer = printer
    end

    def execute(item, order)
        tax_information = 'item isento de impostos conforme disposto na Constituição Art. 150, VI, d.'
        @printer.print("#{item.product.name}: #{tax_information} - Ship to: #{order.address}")
        order.ship_to ShippingLabel.new(order.shipping_address, tax_information)
    end
end