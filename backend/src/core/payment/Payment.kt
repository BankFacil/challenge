package core.payment

import core.order.Invoice
import core.order.Order
import ports.PaymentMethod
import java.util.Date

data class Payment(val order: Order, val paymentMethod: PaymentMethod) {
    val paidAt = Date()
    val authorizationNumber = paidAt.time
    val amount = order.totalAmount
    val invoice = Invoice(order)
}