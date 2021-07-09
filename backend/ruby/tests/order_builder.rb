require_relative '../domain/customer'
require_relative '../domain/payment'
require_relative '../domain/credit_card'
require_relative '../domain/order'

class OrderBuilder
    def initialize
        @paid = false
        @products = []
    end

    def paid
        @paid = true
        self
    end

    def create
        customer = Customer.new 'gimoteco@gmail.com'
        order = Order.new customer
        @products.each {|product| order.add_product(product) }
        payment_method = CreditCard.fetch_by_hashed('123')
        
        if @paid
            order.pay payment_method
        end
        order
    end

    def with_product(product)
        @products << product
        self
    end
end