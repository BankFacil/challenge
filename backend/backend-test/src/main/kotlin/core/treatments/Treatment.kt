package core.treatments

import core.order.Order
import core.order.OrderItem

interface Treatment {
    fun execute(order: Order, item: OrderItem)
}