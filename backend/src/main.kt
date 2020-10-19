package challenge
import challenge.customer.*
import challenge.order.Order
import challenge.payment.CreditCard
import challenge.product.ProductType
import product.DataProduct

fun main() {
    println("Backend Started")

    val shirt = DataProduct("Flowered t-shirt", ProductType.PHYSICAL, 35.00, null)
    val netflix = DataProduct("Netflix (Familiar plan)", ProductType.MEMBERSHIP, 30.90, null)
    val book = DataProduct("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00, null)
    val music = DataProduct("Stairway to Heaven (Digital Music)", ProductType.DIGITAL, 10.00, null)

    val order = Order(Customer(), Address())

    order.addProduct(shirt, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    order.pay(CreditCard("43567890-987654367"))

    order.actionsAfterPayments()

    for (i in order.items){
        println(i.dataProduct.name)
        println("shippingLabel: ${i.dataProduct.execution?.shippingLabelId}")
        println("emailStatus: ${i.dataProduct.execution?.emailStatus}")
        println("notification: ${i.dataProduct.execution?.notification}")
        println(" ")
    }

    println("Total: ${order.totalAmount}")
    println("Total de Desconto: ${order.voucherDiscount}")
    println("Total a Pagar: ${order.totalAmount-order.voucherDiscount}")
}

