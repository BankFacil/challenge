require_relative '../lib/invoice'
require_relative '../lib/shipping_label'
require_relative '../lib/membership'
require_relative '../lib/voucher'

class Payment
  attr_reader :authorization_number, :amount, :invoice, :order, :payment_method, :paid_at, :shippingLabel,:membership, :voucher

  def initialize(attributes = {})
    @authorization_number, @amount = attributes.values_at(:authorization_number, :amount)
    @invoice, @order = attributes.values_at(:invoice, :order)
    @payment_method = attributes.values_at(:payment_method)
  end

  def pay(paid_at = Time.now)
    @amount = order.total_amount
    @authorization_number = Time.now.to_i
    @invoice = Invoice.new(billing_address: order.address, shipping_address: order.address, order: order)
    @paid_at = paid_at
    @order.close(@paid_at)

    @shippingLabel = ShippingLabel.new(order:@order)
    @membership = Membership.new(order:@order)
    @voucher = Voucher.new(order:order)

    if(@order.get_type == :digital)
      @invoice.send_email()
    end
  end


  def paid?
    !paid_at.nil?
  end
end