module BootStrap
  class PaymentDigital
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def pay
      "Enviar email com descrição da compra e vaucher de desconto"
    end
  end
end
