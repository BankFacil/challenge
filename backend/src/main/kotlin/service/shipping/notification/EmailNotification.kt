package service.shipping.notification

import challenge.Customer

class EmailNotification {

    fun sendEmail(customer: Customer, message: String){
        print("\n$message send to ${customer.email}")
    }
}