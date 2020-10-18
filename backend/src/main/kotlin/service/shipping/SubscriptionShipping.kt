package challenge.model

import challenge.Customer
import challenge.Product
import challenge.Shipping
import service.shipping.membership.MembershipActivation
import service.shipping.notification.EmailNotification

class SubscriptionShipping(val customer : Customer): Shipping {

    override fun ship(product: Product) {
        print("\n\nShipping for Subscription item ${product.name}")
        MembershipActivation().activate(customer)
        EmailNotification().sendEmail(customer, "Email notification of activating membership")
    }

}