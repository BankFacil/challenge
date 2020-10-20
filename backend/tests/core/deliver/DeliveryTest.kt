package core.deliver

import core.customer.Address
import core.customer.Customer
import core.product.*
import org.junit.jupiter.api.Test
import ports.*
import kotlin.test.*

class DeliveryTest {

    private val address:Address = Address()
    private val customer: Customer = Customer("Rafael Souza da Silva", "rafael.souza.silva@hotmail.com.br")

    @Test
    fun `test implemented right interfaces in delivery propertie of physical product`(){
        val product: Product = PhysicalProduct("physical", 50.0)

        assertTrue(product.getDelivery() is DeliveryInterface)
        assertTrue(product.getDelivery() is ShippingDeliveryInterface)
        assertTrue(product.getDelivery() is BoxSenderDeliveryInterface)
    }

    @Test
    fun `test implemented right interfaces in delivery propertie of digital product`() {
        val product: Product = DigitalProduct("digital", 50.0)

        assertTrue(product.getDelivery() is DeliveryInterface)
        assertTrue(product.getDelivery() is MailSenderInterface)
        assertTrue(product.getDelivery() is VoucherDeliveryInterface)
    }

    @Test
    fun `test implemented right interfaces in delivery propertie of book product`() {
        val product: Product = BookProduct("book", 50.0)

        assertTrue(product.getDelivery() is DeliveryInterface)
        assertTrue(product.getDelivery() is ShippingDeliveryInterface)
        assertTrue(product.getDelivery() is NotificationShippingDeliveryInterface)
    }

    @Test
    fun `test implemented right interfaces in delivery propertie of membership product`() {
        val product: Product = MembershipProduct("membership", 50.0)

        assertTrue(product.getDelivery() is DeliveryInterface)
        assertTrue(product.getDelivery() is MembershipDeliveryInterface)
        assertTrue(product.getDelivery() is MailSenderInterface)
    }
}