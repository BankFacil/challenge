module OnlineInvoice
  class OrderItem
    attr_reader :order, :product, :vouchers, :close_at

    def initialize(order, product)
      @order = order
      @product = product
      @vouchers = []
      @closed_at = nil
    end

    def add_voucher(voucher)
      @vouchers.push(voucher)
    end

    def discount_value
      @vouchers.map(&:discount_value).inject(:+) || 0
    end

    def subtotal
      100
    end

    def total
      subtotal - discount_value
    end

    def close
      @closed_at = Time.now
    end

    def closed?
      !@closed_at.nil?
    end
  end
end
