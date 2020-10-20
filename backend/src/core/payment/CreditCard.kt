package core.payment

import ports.PaymentMethod

data class CreditCard(val number: String) : PaymentMethod