module BootStrap
  class PaymentSignature
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def pay
      "Ativar a assinatura e notificar o usuário por email"
    end
  end
end
