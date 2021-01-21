package challenge.model

import java.util.*

data class Payment(val order: Order, val paymentMethod: PaymentMethod) {
    private val paidAt = Date()
    val authorizationNumber = paidAt.time
    val amount = order.totalAmount
    val invoice = Invoice(order)
}