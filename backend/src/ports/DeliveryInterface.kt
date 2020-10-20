package ports

import core.order.Order
import core.product.Product

interface DeliveryInterface {
    fun deliver(order: Order, product: Product, quantity: Int)
}