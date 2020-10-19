package challenge.domain.product.strategy

import challenge.domain.customer.Customer
import challenge.domain.product.Physical
import challenge.domain.product.Product
import challenge.domain.product.ShippingLabel

object PhysicalCheckout : CheckoutStrategy {

    override fun checkout(product: Product, customer: Customer): Product {
        println("PhysicalCheckout.checkout(); Product: ${product.name}. Customer: ${customer.name}") //logger
        product as Physical
        return product.copy(shippingLabel = ShippingLabel("Deve ser colocado na caixa para envio."))
    }

}