class InMemoryOrders
    @@orders = {}
    @@id_counter = 1

    def get_by(id)
        @@orders[id]
    end

    def add(order)
        order.id = @@id_counter
        @@id_counter = @@id_counter + 1
        @@orders[order.id] = order;
    end

    def update(order)
        @@orders[order.id] = order;
    end
end