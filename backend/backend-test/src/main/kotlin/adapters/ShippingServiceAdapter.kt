package adapters

import core.order.OrderItem
import ports.ShippingService

class ShippingServiceAdapter : ShippingService {
    override fun ship(item: OrderItem, freeTax: Boolean) {
        println("Shipping product flag free tag is $freeTax")
    }

}