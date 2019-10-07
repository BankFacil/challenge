package challenge.domain.product

import challenge.domain.product.strategy.CheckoutStrategy
import challenge.domain.product.strategy.MembershipCheckout

data class Membership(override val name: String, override val price: Double, val activated: Boolean = false) : Product() {

    override fun getStrategy(): CheckoutStrategy {
        return MembershipCheckout
    }
}