package order

import shipping.ShippingBoxService
import shipping.ShippingLabel

class Physical(name: String, price: Double) : Product(name, price) {
    override fun pay(payment: Payment) {
        val shippingLabel = ShippingLabel(payment.order.id.toString())
        OrderPaymentEventContainer.addEvent(PhysicalProductPaidEvent(payment.order, shippingLabel, ShippingBoxService()))
    }
}