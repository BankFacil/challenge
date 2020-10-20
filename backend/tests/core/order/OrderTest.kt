package core.order

import core.customer.Address
import core.customer.Customer
import core.payment.CreditCard
import core.payment.Payment
import core.product.PhysicalProduct
import core.product.Product
import org.junit.jupiter.api.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull

class OrderTest {

    private val address: Address = Address()
    private val customer: Customer = Customer("Rafael Souza da Silva", "rafael.souza.silva@hotmail.com.br")

    @Test
    fun `test value properties changed in a order`() {
        val product: Product = PhysicalProduct("physical", 50.0)
        val order = Order(customer, address)
        order.addProduct(product, 1)

        assertEquals(1, order.getItems().count())
        assertNull(order.closedAt)
        assertNull(order.payment)

        val payment = CreditCard("123456789")

        order.pay(payment)

        assertNull(order.closedAt)
        assertEquals(Payment(order, payment), order.payment)

        order.deliver()

        assertNotNull(order.closedAt)
    }

}