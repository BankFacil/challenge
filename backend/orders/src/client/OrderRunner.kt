package client

import challenge.model.*
import challenge.service.PaymentService
import challenge.service.paymentstrategy.PaymentDigitalStrategy
import challenge.service.paymentstrategy.PaymentPhysicalItemStrategy
import challenge.service.paymentstrategy.PaymentRegularBookStrategy
import challenge.service.paymentstrategy.PaymentServiceSignatureStrategy

fun main() {
    val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL,35.00)
    val netflix = Product("Familiar plan", ProductType.MEMBERSHIP,29.90)
    val book = Product("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK,120.00)
    val music = Product("Stairway to Heaven", ProductType.DIGITAL,5.00)

    val order = Order(Customer("Henry", "Henry@email.com"), Address())

    val paymentService = PaymentService()

    order.addProduct(shirt, 2, PaymentPhysicalItemStrategy())
    order.addProduct(netflix, 1, PaymentServiceSignatureStrategy())
    order.addProduct(book, 1, PaymentRegularBookStrategy())
    order.addProduct(music, 1, PaymentDigitalStrategy())

    println("Your order total amount is: " + order.totalAmount)

    paymentService.processPayment(order = order, method = CreditCard("43567890-987654367"))

    println("Congratulations! Your order $order has been approved")
    // now, how to deal with shipping rules then?
}