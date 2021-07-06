package ports

import core.customer.Customer

interface MembershipService {
    fun active(customer: Customer)
}