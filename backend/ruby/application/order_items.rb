require_relative '../domain/order'
require_relative '../domain/customer'
require_relative '../domain/product'

class OrderItems
    def initialize(orders)
        @orders = orders;
    end

    def order(customer_mail, items)
        customer = Customer.new(customer_mail)
        order = Order.new customer
        items.each {|item| order.add_product(Product.new(item["name"], item["type"]))}
        @orders.add(order);
        order
    end
end