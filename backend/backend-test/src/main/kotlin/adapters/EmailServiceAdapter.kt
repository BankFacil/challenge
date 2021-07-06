package adapters

import core.customer.Customer
import core.order.OrderItem
import ports.EmailService

class EmailServiceAdapter : EmailService {
    override fun send(customer: Customer, orderItem: OrderItem) {
        println("Sending e-mail to $customer about item $orderItem")
    }

}