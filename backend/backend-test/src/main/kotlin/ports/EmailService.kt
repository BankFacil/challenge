package ports

import core.customer.Customer
import core.order.OrderItem

interface EmailService {
    fun send(customer: Customer, orderItem: OrderItem)
}