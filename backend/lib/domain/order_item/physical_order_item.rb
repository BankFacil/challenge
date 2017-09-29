module OnlineInvoice
  class PhysicalOrderItem < OrderItem
    attr_reader :shipping_label

    def initialize(order, product, shipping_label)
      super(order, product)
      @shipping_label = shipping_label
    end

    def close
      super
      @shipping_label.send_label('Deverá ser transportado para a caixa de envio')
    end
  end
end
