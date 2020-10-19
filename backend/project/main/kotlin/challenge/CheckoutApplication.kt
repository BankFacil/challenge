package challenge

import challenge.domain.adress.Address
import challenge.domain.customer.Customer
import challenge.domain.order.Order
import challenge.domain.payment.CreditCard
import challenge.domain.product.Book
import challenge.domain.product.Digital
import challenge.domain.product.Membership
import challenge.domain.product.Physical

fun main(args: Array<String>) {
    val shirt = Physical("Flowered t-shirt", 35.00)
    val netflix = Membership("Familiar plan", 29.90)
    val book = Book("The Hitchhiker's Guide to the Galaxy", 120.00)
    val music = Digital("Stairway to Heaven", 5.00)

    val order = Order(Customer("Alan", "alan@alan.com.br"), Address())

    order.addProduct(shirt, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    order.pay(CreditCard("43567890-987654367"))

    order.checkout()
}