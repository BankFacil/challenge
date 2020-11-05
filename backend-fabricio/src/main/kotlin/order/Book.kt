package order

import shipping.ShippingBoxService
import shipping.ShippingLabel

class Book(name: String, price: Double) : Product(name, price) {
    private val bookShippingLabelNotification = "Este item é isento de impostos conforme disposto na Constituição Art. 150, VI, d."

    override fun pay(payment: Payment) {
        val shippingLabel = ShippingLabel(payment.order.id.toString(), bookShippingLabelNotification)
        OrderPaymentEventContainer.addEvent(BookProductPaidEvent(payment.order, shippingLabel, ShippingBoxService()))

    }
}