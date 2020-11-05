package order

interface PaymentMethod

data class CreditCard(val number: String) : PaymentMethod

data class Payment(val order: Order, val paymentMethod: PaymentMethod)