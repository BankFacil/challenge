class Invoice
    attr_reader :billing_address, :shipping_address, :order
    
    def initialize(order)
      @billing_address = order.address
      @shipping_address = order.address
      @order = order
    end
end