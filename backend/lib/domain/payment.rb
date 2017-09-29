module OnlineInvoice
  class Payment
    attr_reader :authorization_number, :amount, :invoice, :order, :payment_method, :paid_at

    def initialize(attributes = {})
      @authorization_number, @amount = attributes.values_at(
        :authorization_number, :amount
      )
      @invoice, @order = attributes.values_at(:invoice, :order)
      @payment_method = attributes.values_at(:payment_method)
    end

    def pay(paid_at = Time.now)
      @amount = order.total_amount
      @authorization_number = Time.now.to_i
      @invoice = Invoice.new(
        billing_address: @order.address,
        shipping_address: @order.address,
        order: @order
      )
      @paid_at = paid_at
      @order.close(@paid_at)
    end

    def paid?
      !paid_at.nil?
    end
  end
end
