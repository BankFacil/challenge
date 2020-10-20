package ports

import core.customer.Customer
import core.customer.Membership

interface MembershipDeliveryInterface {
    fun activeMembership(customer: Customer) : Membership
}