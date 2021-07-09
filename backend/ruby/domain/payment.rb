require_relative './invoice'

class Payment
    attr_reader :authorization_number, :amount, :invoice, :order, :payment_method, :paid_at
    
    def initialize(payment_method, paid_at, order)
      @payment_method = payment_method;
      @paid_at = paid_at;
      @order = order;
      @amount = order.total_amount
      @authorization_number = Time.now.to_i
      generate_invoice
    end
    
    def generate_invoice()
      @invoice = Invoice.new(@order)
    end
end