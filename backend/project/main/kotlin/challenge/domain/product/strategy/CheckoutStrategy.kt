package challenge.domain.product.strategy

import challenge.domain.customer.Customer
import challenge.domain.product.Product

interface CheckoutStrategy {
    fun checkout(product: Product, customer: Customer) : Product
}