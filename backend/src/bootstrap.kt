import domain.customer.Address
import domain.customer.Customer
import domain.order.Order
import domain.payment.CreditCard
import domain.product.Book
import domain.product.DigitalMidia
import domain.product.PhysicalItem
import domain.product.ServiceSubscription

fun main(args : Array<String>) {
    val shirt = PhysicalItem("Flowered t-shirt", 35.00)
    val netflix = ServiceSubscription("Familiar plan", 29.90)
    val book = Book("The Hitchhiker's Guide to the Galaxy", 120.00)
    val music = DigitalMidia("Stairway to Heaven", 5.00)

    val order = Order(Customer("John"), Address("Bourbon Street"))

    order.addProduct(shirt, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    order.pay(CreditCard("43567890-987654367"))
    order.processShipping()
    order.applyDiscounts()
}