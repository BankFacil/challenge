module BootStrap
  class PaymentBook
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def pay
      "Shipping isento de imposto"
    end
  end
end
