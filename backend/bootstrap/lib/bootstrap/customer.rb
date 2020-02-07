module BootStrap
  class Customer
    attr_reader :name,
                :address

    def initialize(costumer_data = OpenStruct.new)
      @name    = costumer_data.name
      @address = costumer_data.address
    end
  end
end
