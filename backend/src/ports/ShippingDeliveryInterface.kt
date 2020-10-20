package ports

import core.deliver.ShippingLabel
import core.order.Order

interface ShippingDeliveryInterface {
    fun createShipping(order: Order, message: String) : ShippingLabel
}