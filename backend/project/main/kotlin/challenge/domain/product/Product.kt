package challenge.domain.product

import challenge.domain.product.strategy.CheckoutStrategy


abstract class Product {
    abstract val name: String
    abstract val price: Double
    abstract fun getStrategy() : CheckoutStrategy
}