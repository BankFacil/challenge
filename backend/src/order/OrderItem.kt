package challenge.order

import product.DataProduct

data class OrderItem(val dataProduct: DataProduct, val quantity: Int) {
    val total get() = (dataProduct.price * quantity)
}