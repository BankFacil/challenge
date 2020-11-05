package order

import shipping.ShippingBoxService
import shipping.ShippingLabel

class BookProductPaidEvent (
        order: Order,
        private val shippingLabel: ShippingLabel,
        private val shippingBoxService: ShippingBoxService) : OrderPaymentEvent(OrderPaymentEventType.BOOK, order) {

    override fun handle() {
        shippingBoxService.print(shippingLabel)
    }
}