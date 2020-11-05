package order

import shipping.NotificationService

class Membership(name: String, price: Double) : Product(name, price) {
    override fun pay(payment: Payment) {
        activateSubscription()
        OrderPaymentEventContainer.addEvent(MembershipProductPaidEvent(payment.order, NotificationService()))
    }

    private fun activateSubscription() {}
}