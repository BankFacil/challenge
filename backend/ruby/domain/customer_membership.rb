class CustomerMembership
    attr_reader :activated, :product

    def initialize(customer, product)
        @customer = customer
        @product = product
        @activated = false
    end

    def active
        @activated = true
    end
end