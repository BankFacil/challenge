package service.shipping.membership

import challenge.Customer

class MembershipActivation {

    fun activate(customer: Customer){
        print("\nActivation of membership for ${customer.email}")
    }
}