package challenge.customer

import challenge.order.Order

data class DataInvoice(val order: Order) {
    val billingAddress: Address = order.address
    val shippingAddress: Address = order.address
}