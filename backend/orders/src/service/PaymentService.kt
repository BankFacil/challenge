package challenge.service

import challenge.model.Order
import challenge.model.Payment
import challenge.model.PaymentMethod
import java.lang.Exception

class PaymentService {

    fun processPayment(method: PaymentMethod, order: Order) {
        if (order.payment != null)
            throw Exception(ALREADY_PAYED_EXCEPTION_MESSAGE)

        if (order.items.count() == 0)
            throw Exception(EMPTY_ORDER_EXCEPTION_MESSAGE)

        val payment  = Payment(order, method)

        order.payment = payment

        order.paymentStrategies.forEach { it.pay(payment) }

        order.close()
    }

    companion object {
        const val ALREADY_PAYED_EXCEPTION_MESSAGE = "The order has already been paid!"
        const val EMPTY_ORDER_EXCEPTION_MESSAGE = "Empty order can not be paid!"
    }
}