package ports

import core.deliver.ShippingLabel
import core.product.Product

interface BoxSenderDeliveryInterface {
    fun putOnBoxSender(shippingLabel: ShippingLabel, product: Product, quantity: Int)
}