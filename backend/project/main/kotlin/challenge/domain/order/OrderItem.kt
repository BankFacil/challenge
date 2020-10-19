package challenge.domain.order

import challenge.domain.product.Product

data class OrderItem(val product: Product, val quantity: Int) {
    val total get() = product.price * quantity
}