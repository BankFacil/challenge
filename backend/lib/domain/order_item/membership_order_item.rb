module OnlineInvoice
  class MembershipOrderItem < OrderItem
    attr_reader :membership_repository, :mailer

    def initialize(order, product, membership_repository, mailer)
      super(order, product)
      @membership_repository = membership_repository
      @mailer = mailer
    end

    def close
      super
      @membership_repository.activate(self)
      @mailer.send_mail(@order.customer.email, "Você acabou de assinar #{@product.name}")
    end
  end
end
