package rsekine

import challenge.*
import org.junit.jupiter.api.Test

class OrderTest {

    private  val order = Order(
        Customer("Ricardo Vilas Boas Sekine", "ricardo.vbsekine@gmail.com"),
        Address("Rua Sem saída, nº 50 - Bairro ZeroUm - Cidade de Gigabyte / GB")
    )

    private val creditCard = CreditCard("43567890-987654367")

    @Test
    fun physicalProductTest() {
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        this.order.addProduct(shirt, 2)
        this.order.pay(this.creditCard)
        this.order.dispathItems()
    }

    @Test
    fun membershipProductTest() {
        val netflix = Product("Familiar plan", ProductType.MEMBERSHIP, 29.90)
        this.order.addProduct(netflix, 1)
        this.order.pay(this.creditCard)
        this.order.dispathItems()
    }

    @Test
    fun bookProductTest() {
        val book = Product("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00)
        this.order.addProduct(book, 1)
        this.order.pay(this.creditCard)
        this.order.dispathItems()
    }

    @Test
    fun digitalProductTest() {
        val music = Product("Stairway to Heaven", ProductType.DIGITAL, 5.00)
        this.order.addProduct(music, 1)
        this.order.pay(this.creditCard)
        this.order.dispathItems()
    }

    @Test
    fun multipleProductsTest() {
        val order = generateOrder();
        order.pay(this.creditCard)
        order.dispathItems()
    }

}