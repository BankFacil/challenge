package payment

import challenge.customer.DataInvoice
import challenge.order.Order
import challenge.payment.PaymentMethod
import java.util.*

data class DataPayment(val order: Order, val paymentMethod: PaymentMethod) {
    val paidAt = Date()
    val authorizationNumber = paidAt.time
    val amount = order.totalAmount - order.voucherDiscount
    val invoice = DataInvoice(order)
}
