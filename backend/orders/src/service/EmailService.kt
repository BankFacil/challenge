package challenge.service

import challenge.model.Customer
import challenge.model.OrderItem

class EmailService {

    fun sendEmail(customer: Customer, items: List<OrderItem>, notification: String) {
        println("----||-----")
        println("Sending email to $customer with Items: $items")
        println(notification)
        println("----||-----")
    }
}