import core.customer.Address
import core.customer.Customer
import core.order.Order
import core.payment.CreditCard
import core.product.BookProduct
import core.product.DigitalProduct
import core.product.MembershipProduct
import core.product.PhysicalProduct

fun main(args : Array<String>) {
    val shirt = PhysicalProduct("Flowered t-shirt", 35.00)
    val netflix = MembershipProduct("Familiar plan", 29.90)
    val book = BookProduct("The Hitchhiker's Guide to the Galaxy", 120.00)
    val music = DigitalProduct("Stairway to Heaven", 5.00)

    val order = Order(
        Customer(
            "Rafael Souza da Silva",
            "rafael.souza.silva@hotmail.com.br"
        ), Address()
    )

    order.addProduct(shirt, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    order.pay(CreditCard("43567890-987654367"))
    order.deliver()
}

