package lib

import challenge.*
import io.mockk.*

import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.TestInstance

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
internal class DeliveryManagementTest {
    private val customer = Customer("John", "email@john.com")
    private val address = Address()
    private val order = Order(customer, address)

    @BeforeAll
    fun setUp() = MockKAnnotations.init(this)

    @Test
    fun `test physical delivery process flow`() {
        val physicalProduct = mockk<PhysicalProduct>()
        val physicalDeliveryRule = spyk<PhysicalDeliveryRule>()

        order.addProduct(physicalProduct, 10)
        every { physicalProduct.getDeliveryRule() } returns physicalDeliveryRule

        DeliveryManagement(order).process()

        verify(exactly = 1) { physicalProduct.getDeliveryRule() }
        verify(exactly = 1) { physicalDeliveryRule.deliver(physicalProduct, 10, order) }
        verify(exactly = 1) { physicalDeliveryRule.createShippingLabel(order, "") }
    }

    @Test
    fun `test book delivery process flow`() {
        val bookProduct = mockk<BookProduct>()
        val bookDeliveryRule = spyk<BookDeliveryRule>()

        order.addProduct(bookProduct, 1)

        every { bookProduct.getDeliveryRule() } returns bookDeliveryRule

        DeliveryManagement(order).process()

        verify(exactly = 1) { bookProduct.getDeliveryRule() }
        verify(exactly = 1) { bookDeliveryRule.deliver(bookProduct, 1, order) }
        verify(exactly = 1) { bookDeliveryRule.createShippingLabel(order, "") }
    }

    @Test
    fun `test digital delivery process flow`() {
        val digitalProduct = mockk<DigitalProduct>()
        val digitalDeliveryRule = spyk<DigitalDeliveryRule>()

        order.addProduct(digitalProduct, 1)

        every { digitalProduct.getDeliveryRule() } returns digitalDeliveryRule

        DeliveryManagement(order).process()

        verify(exactly = 1) { digitalProduct.getDeliveryRule() }
        verify(exactly = 1) { digitalDeliveryRule.deliver(digitalProduct, 1, order) }
        verify(exactly = 1) { digitalDeliveryRule.sendNotification(order.customer, digitalProduct) }
    }

    @Test
    fun `test membership delivery process flow`() {
        val membership = mockk<Membership>()
        val digitalDeliveryRule = spyk<MembershipDeliveryRule>()

        order.addProduct(membership, 1)

        every { membership.getDeliveryRule() } returns digitalDeliveryRule

        DeliveryManagement(order).process()

        verify(exactly = 1) { membership.getDeliveryRule() }
        verify(exactly = 1) { digitalDeliveryRule.deliver(membership, 1, order) }
        verify(exactly = 1) { digitalDeliveryRule.sendNotification(order.customer, membership) }
    }
}