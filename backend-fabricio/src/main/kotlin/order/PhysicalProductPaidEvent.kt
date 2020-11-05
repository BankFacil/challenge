package order

import shipping.ShippingBoxService
import shipping.ShippingLabel

class PhysicalProductPaidEvent (
        order: Order,
        private val shippingLabel: ShippingLabel,
        private val shippingBoxService: ShippingBoxService) : OrderPaymentEvent(OrderPaymentEventType.PHYSICAL, order) {

    override fun handle() {
        shippingBoxService.print(shippingLabel)
    }
}