package ports

import core.order.OrderItem

interface ShippingService {
    fun ship(item: OrderItem, freeTax: Boolean)
}