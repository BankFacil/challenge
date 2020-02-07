module BootStrap
  class PaymentFactory

    def self.create(order_item)
      type= order_item.type.to_s.capitalize
      const_get("BootStrap::Payment#{type}").new(order_item)
    end
  end
end
