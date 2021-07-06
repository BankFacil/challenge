package adapters

import core.customer.Customer
import ports.MembershipService

class MembershipServiceAdapter : MembershipService {
    override fun active(customer: Customer) {
        println("Activating customer $customer")
    }

}