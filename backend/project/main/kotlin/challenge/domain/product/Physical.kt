package challenge.domain.product

import challenge.domain.product.strategy.PhysicalCheckout


data class Physical(override val name: String, override val price: Double, val shippingLabel: ShippingLabel? = null) : Product() {

    override fun getStrategy(): PhysicalCheckout {
        return PhysicalCheckout
    }
}