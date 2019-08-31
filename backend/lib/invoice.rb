class Invoice
  attr_reader :billing_address, :shipping_address, :order, :email_message

  def initialize(attributes = {})
    @billing_address = attributes.values_at(:billing_address)
    @shipping_address = attributes.values_at(:shipping_address)
    @order = attributes.values_at(:order)

  end

  def send_email
    @email_message = 'Detalhes da compra'
  end
end