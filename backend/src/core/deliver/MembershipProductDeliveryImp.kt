package core.deliver

import config.DependenciesConfig
import core.customer.Customer
import core.customer.Membership
import core.order.Order
import core.product.Product
import ports.DeliveryInterface
import ports.MailSenderInterface
import ports.MembershipDeliveryInterface

class MembershipProductDeliveryImp(private val mailSender: MailSenderInterface = DependenciesConfig.MailSender()):
    DeliveryInterface,
    MembershipDeliveryInterface,
    MailSenderInterface {

    override fun send(mail: Mail) {
        mailSender.send(mail)
    }

    override fun activeMembership(customer: Customer): Membership {
        val membership = Membership(customer)
        membership.activate()
        return membership
    }

    override fun deliver(order: Order, product: Product, quantity: Int) {
        var membership = this.activeMembership(order.customer)
        val mail = Mail(
            order.customer,
            "Your Membership",
            "Hi ${order.customer.name}, your membership is active!"
        )
        this.send(mail)
    }
}
