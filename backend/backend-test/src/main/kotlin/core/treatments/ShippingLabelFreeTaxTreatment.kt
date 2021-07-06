package core.treatments

import adapters.ShippingServiceAdapter
import core.order.Order
import core.order.OrderItem
import ports.ShippingService

class ShippingLabelFreeTaxTreatment(private val shippingService: ShippingService) : Treatment {

    override fun execute(order: Order, item: OrderItem) {
        println("Generating shipping label to order $order with free tax.")
        shippingService.ship(item, true)
    }

    companion object {
        fun treatment() = ShippingLabelFreeTaxTreatment(ShippingServiceAdapter())
    }
}