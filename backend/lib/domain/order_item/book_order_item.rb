module OnlineInvoice
  class BookOrderItem < OrderItem
    attr_reader :shipping_label

    def initialize(order, product, shipping_label)
      super(order, product)
      @shipping_label = shipping_label
    end

    def close
      super
      @shipping_label.send_label('Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.')
    end
  end
end
