package challenge.domain.product

import challenge.domain.product.strategy.BookCheckout


data class Book(override val name: String, override val price: Double, val shippingLabel: ShippingLabel? = null) : Product() {

    override fun getStrategy(): BookCheckout {
        return BookCheckout
    }

}