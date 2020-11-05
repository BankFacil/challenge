package order

import shipping.NotificationService

class MembershipProductPaidEvent (
        order: Order,
        private val notificationService: NotificationService) : OrderPaymentEvent(OrderPaymentEventType.MEMBERSHIP, order) {

    override fun handle() {
        notificationService.notifyCustomerOrder(order)
    }
}