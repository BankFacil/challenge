module OnlineInvoice
  class DigitalOrderItem < OrderItem
    attr_reader :mailer

    DISCOUNT_DEFAULT = 10

    def initialize(order, product, mailer)
      super(order, product)
      @mailer = mailer
    end

    def close
      super
      @mailer.send_mail(@order.customer.email, "Você acabou de comprar #{@product.name}")
      add_voucher(Voucher.new(DISCOUNT_DEFAULT))
    end
  end
end
