module OnlineInvoice
  class Voucher
    attr_reader :discount_value

    def initialize(discount_value)
      @discount_value = discount_value
    end
  end
end
