package order

import shipping.NotificationService

class DigitalProductPaidEvent (
        order: Order,
        private val discountVoucher: Double,
        private val notificationService: NotificationService) : OrderPaymentEvent(OrderPaymentEventType.DIGITAL, order) {

    override fun handle() {
        notificationService.notifyCustomerOrder(order)
        order.customer.grantVoucherDiscount(discountVoucher)
    }
}