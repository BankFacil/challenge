module BootStrap
  class Payment
    attr_reader :order,
                :payment_method,
                :paid_at

    def initialize(payment_data)
      @order = payment_data.order
      @payment_method = payment_data.payment_method
    end

    def pay
      @paid_at = Time.now
      order.items.map do |item|
        PaymentFactory.create(item).pay
      end
    end

    def paid?
      !paid_at.nil?
    end
  end
end
