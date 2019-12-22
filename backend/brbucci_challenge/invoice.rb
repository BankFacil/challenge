class Invoice
  attr_reader :billing_address, :shipping_address, :order

  def initialize(attributes = {})
    @billing_address = attributes[:billing_address]
    @shipping_address = attributes[:shipping_address]
    @order = attributes[:order]
  end
end
