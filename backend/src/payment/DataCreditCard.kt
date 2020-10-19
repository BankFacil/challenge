package challenge.payment

data class CreditCard(val number: String) : PaymentMethod

interface PaymentMethod