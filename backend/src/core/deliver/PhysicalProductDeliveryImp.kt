package core.deliver

import core.order.Order
import core.product.Product
import ports.BoxSenderDeliveryInterface
import ports.DeliveryInterface
import ports.ShippingDeliveryInterface

class PhysicalProductDeliveryImp :
    DeliveryInterface, ShippingDeliveryInterface, BoxSenderDeliveryInterface {
    override fun putOnBoxSender(shippingLabel: ShippingLabel, product: Product, quantity: Int) {
        println("putting ${quantity} of product ${product.name} into BoxSender with shipping label number -> ${shippingLabel.id}.")
    }

    override fun createShipping(order: Order, message: String): ShippingLabel {
        return ShippingLabel(order)
    }

    override fun deliver(order: Order, product: Product, quantity: Int) {
        val shippingLabel = this.createShipping(order,"")
        this.putOnBoxSender(shippingLabel, product, quantity)
    }
}
