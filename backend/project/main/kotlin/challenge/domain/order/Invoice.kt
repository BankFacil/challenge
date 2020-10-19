package challenge.domain.order

import challenge.domain.adress.Address

data class Invoice(val order: Order) {
    val billingAddress: Address = order.address
    val shippingAddress: Address = order.address
}