package order

import shipping.NotificationService

class Digital(name: String, price: Double) : Product(name, price) {
    private val voucherDiscount: Double = 10.0

    override fun pay(payment: Payment) {
        OrderPaymentEventContainer.addEvent(DigitalProductPaidEvent(payment.order, voucherDiscount, NotificationService()))
    }
}