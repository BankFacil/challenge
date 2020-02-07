module BootStrap
  class PaymentItem
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def pay
      "Shipping para caixa de envio"
    end
  end
end
