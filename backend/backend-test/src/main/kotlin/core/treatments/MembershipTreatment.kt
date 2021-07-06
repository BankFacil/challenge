package core.treatments

import adapters.EmailServiceAdapter
import adapters.MembershipServiceAdapter
import core.order.Order
import core.order.OrderItem
import ports.EmailService
import ports.MembershipService

class MembershipTreatment(private val membershipService: MembershipService, private val emailService: EmailService) :
    Treatment {
    override fun execute(order: Order, item: OrderItem) {
        membershipService.active(order.customer)
        emailService.send(order.customer, item)
    }

    companion object {
        fun treatment() = MembershipTreatment(MembershipServiceAdapter(), EmailServiceAdapter())
    }

}