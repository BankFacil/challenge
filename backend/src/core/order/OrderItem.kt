package core.order

import core.product.Product

data class OrderItem(val product: Product, val quantity: Int) {
    val total get() = product.price * quantity
}