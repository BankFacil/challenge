module BootStrap
  class Order
    attr_reader :customer,
                :items,
                :address,
                :closed_at

    def initialize(customer)
      @customer = customer
      @items = []
      @address = customer.address
    end

    def add_product(product)
      @items << product
    end

    def total_amount
      @items.map(&:price).inject(:+)
    end

    def close
      @closed_at = Time.now
    end
  end
end
