package challenge

import java.util.*

/**
 * Handles the payment of the [order] by [paymentMethod] and creates [invoice]
 */
data class Payment(val order: Order, val paymentMethod: PaymentMethod) {
    val paidAt = Date()
    val authorizationNumber = paidAt.time
    val amount = order.totalAmount
    val invoice = Invoice(order)
}

/**
 * CreditCard PaymentMethod with the credit card [number]
 */
data class CreditCard(val number: String) : PaymentMethod
interface PaymentMethod

/**
 * Invoice of the [order]
 */
data class Invoice(val order: Order) {
    val billingAddress: Address = order.address
    val shippingAddress: Address = order.address
}