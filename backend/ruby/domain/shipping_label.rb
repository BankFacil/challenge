class ShippingLabel
    attr_reader :shipping_address, :tax_information

    def initialize(shipping_address, tax_information = nil)
        @shipping_address = shipping_address
        @tax_information = tax_information
    end
end