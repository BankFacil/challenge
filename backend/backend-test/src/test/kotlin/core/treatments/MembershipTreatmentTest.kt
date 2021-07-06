package core.treatments

import adapters.EmailServiceAdapter
import adapters.MembershipServiceAdapter
import core.customer.Address
import core.customer.Customer
import core.order.Order
import core.order.Product
import core.order.ProductType
import io.mockk.spyk
import io.mockk.verify
import org.junit.jupiter.api.Test
import ports.EmailService
import ports.MembershipService

internal class MembershipTreatmentTest {
    val membershipService: MembershipService = spyk<MembershipServiceAdapter>()
    val emailService: EmailService = spyk<EmailServiceAdapter>()

    val membershipTreatment = MembershipTreatment(membershipService, emailService)

    @Test
    fun `given an order and order item should call membership service and email service`() {
        val netflix = Product("Familiar plan", ProductType.MEMBERSHIP, 29.90)
        val order = Order(Customer(), Address())
        order.addProduct(netflix, 1)
        val orderItem = order.getItems().first()

        membershipTreatment.execute(order, orderItem)

        verify(exactly = 1) { membershipService.active(order.customer) }
        verify(exactly = 1) { emailService.send(order.customer, orderItem) }
    }
}