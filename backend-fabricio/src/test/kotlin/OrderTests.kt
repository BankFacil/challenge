import main.BusinessException
import order.*
import org.junit.Test
import kotlin.test.assertFailsWith

class OrderTests {

    @Test
    fun createOrderWithoutItems() {
        assertFailsWith(BusinessException::class) {
            val order = Order(Customer())
            order.pay(CreditCard("43567890-987654367"))
        }
    }

    @Test
    fun createOrderWithDuplicatedItems() {
        assertFailsWith(BusinessException::class) {
            val shirt = Physical("Flowered t-shirt", 35.00)
            val order = Order(Customer())

            order.addProduct(shirt, 2)
            order.addProduct(shirt, 2)
        }
    }

    @Test
    fun createOrderOnlyOnceAppliedDiscount() {

        val music = Digital("Stairway to Heaven", 5.00)
        val music2 = Digital("Stairway to Heaven2", 5.00)

        val order = Order(Customer())

        order.addProduct(music, 1)
        order.addProduct(music2, 1)

        order.pay(CreditCard("43567890-987654367"))

        assert(order.customer.totalVoucher == 10.0)
    }

    @Test
    fun createOrderSuccessful() {

        val shirt = Physical("Flowered t-shirt", 35.00)
        val netflix = Membership("Familiar plan", 29.90)
        val book = Book("The Hitchhiker's Guide to the Galaxy", 120.00)
        val music = Digital("Stairway to Heaven", 5.00)

        val order = Order(Customer())

        order.addProduct(shirt, 2)
        order.addProduct(netflix, 1)
        order.addProduct(book, 1)
        order.addProduct(music, 1)

        order.pay(CreditCard("43567890-987654367"))
    }
}