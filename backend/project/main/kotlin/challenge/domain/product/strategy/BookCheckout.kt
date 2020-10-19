package challenge.domain.product.strategy

import challenge.domain.customer.Customer
import challenge.domain.product.Book
import challenge.domain.product.Product
import challenge.domain.product.ShippingLabel


object BookCheckout : CheckoutStrategy {

    override fun checkout(product: Product, customer: Customer): Product {
        println("BookCheckout.checkout(); Product: ${product.name}. Customer: ${customer.name}")
        product as Book
        return product.copy(shippingLabel = ShippingLabel("Item isento de impostos conforme disposto na Constituição Art. 150, VI, d."))
    }

}