package challenge.service.paymentstrategy

import challenge.model.Payment

interface PaymentStrategy {
    fun pay(payment: Payment)
}