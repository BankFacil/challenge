package challenge.domain.product

import challenge.domain.product.strategy.CheckoutStrategy
import challenge.domain.product.strategy.DigitalCheckout

class Digital(override val name: String, override val price: Double) : Product() {

    override fun getStrategy(): CheckoutStrategy {
        return DigitalCheckout
    }
}