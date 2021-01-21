package challenge.model

data class OrderItem(val product: Product, val quantity: Int) {
    val total get() = product.price * quantity
}