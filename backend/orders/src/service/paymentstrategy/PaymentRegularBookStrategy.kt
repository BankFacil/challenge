package challenge.service.paymentstrategy

import challenge.model.Payment
import challenge.model.ProductType
import challenge.model.ShippingLabel
import challenge.service.ShippingService

class PaymentRegularBookStrategy: PaymentStrategy {

    private val shippingService = ShippingService()

    override fun pay(payment: Payment) {
        val shippingLabel = ShippingLabel(notification = NOTIFICATION, items = payment.order.items.filter { it.product.type == ProductType.BOOK })
        shippingService.shipProduct(shippingLabel)
    }

    companion object {
        const val NOTIFICATION = "Product Free from taxes, according to Constitution Art. 150, VI, d."
    }
}