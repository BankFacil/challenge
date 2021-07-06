package core.treatments

import adapters.ShippingServiceAdapter
import core.order.Order
import core.order.OrderItem
import ports.ShippingService

class ShippingLabelTreatment(private val shippingService: ShippingService) : Treatment {

    override fun execute(order: Order, item: OrderItem) {
        println("Generating shipping label to order $order with tax.")
        shippingService.ship(item, false)
    }

    companion object {
        fun treatment() = ShippingLabelTreatment(ShippingServiceAdapter())
    }
}