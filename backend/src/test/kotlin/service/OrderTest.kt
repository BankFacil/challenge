package service

import challenge.*
import org.junit.Test
import java.util.*
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull

class OrderTest {

    @Test
    fun addProductTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        order.addProduct(shirt, 1)
    }


    @Test
    fun addProductAlreadyInOrderTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        order.addProduct(shirt, 1)

        assertFailsWith(Exception::class) {
            order.addProduct(shirt, 1)
        }
    }

    @Test
    fun payOrderTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())
        val paymentMethod = CreditCard("43567890-987654367")

        assertNotNull(Payment(order, paymentMethod))
    }

    @Test
    fun orderAlreadyPaidTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        order.addProduct(shirt, 1)
        order.pay(CreditCard("43567890-987654367"))

        assertFailsWith(Exception::class) {
            order.pay(CreditCard("43567890-987654367"))
        }
    }

    @Test
    fun emptyOrderPayTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())

        assertFailsWith(Exception::class) {
            order.pay(CreditCard("43567890-987654367"))
        }
    }

    @Test
    fun shipOrderTest() {
        val order = Order(Customer("tais.fguerra@gmail.com"), Address())
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        val netflix = Product("Familiar plan", ProductType.MEMBERSHIP, 29.90)
        val book = Product("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00)
        val music = Product("Stairway to Heaven", ProductType.DIGITAL, 5.00)

        order.addProduct(shirt, 2)
        order.addProduct(netflix, 1)
        order.addProduct(book, 1)
        order.addProduct(music, 1)

        order.pay(CreditCard("43567890-987654367"))

        order.ship()
    }

}