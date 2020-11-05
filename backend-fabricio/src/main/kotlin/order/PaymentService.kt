package order

class PaymentService {
    companion object {
        fun execute(payment: Payment) {
            payment.order.items.forEach {
                it.product.pay(payment)
            }

            if(OrderPaymentEventContainer.hasEvents) {
                OrderPaymentEventContainer.handleEvents()
            }
        }
    }
}