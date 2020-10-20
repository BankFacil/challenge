package core.deliver

import core.order.Order
import core.product.Product
import ports.DeliveryInterface
import ports.NotificationShippingDeliveryInterface
import ports.ShippingDeliveryInterface

class BookProductDeliveryImp : DeliveryInterface, ShippingDeliveryInterface,
    NotificationShippingDeliveryInterface {
    override fun generateNotification(message: String): Notification {
        return Notification(message)
    }

    override fun createShipping(order: Order, message: String): ShippingLabel {
        val shippingLabel = ShippingLabel(order)
        shippingLabel.notification = generateNotification(message)
        return shippingLabel
    }

    override fun deliver(order: Order, product: Product, quantity: Int) {
        val shippingLabel = this.createShipping(order,"Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.")
    }
}