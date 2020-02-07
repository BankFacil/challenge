module BootStrap
  class Product
    attr_reader :name,
                :type,
                :price

    def initialize(name, type, price)
      @name  = name
      @type  = type
      @price = price
    end
  end
end
