package core.treatments

import adapters.EmailServiceAdapter
import adapters.VoucherServiceAdapter
import core.customer.Address
import core.customer.Customer
import core.order.Order
import core.order.Product
import core.order.ProductType
import io.mockk.mockk
import io.mockk.spyk
import io.mockk.verify
import org.junit.jupiter.api.Test
import ports.EmailService
import ports.VoucherService

internal class DigitalTreatmentTest {

    val voucherService: VoucherService = spyk<VoucherServiceAdapter>()
    val emailService: EmailService = spyk<EmailServiceAdapter>()

    val digitalTreatment = DigitalTreatment(voucherService, emailService)

    @Test
    fun `given an order and order item should call voucher service and email service`() {
        val music = Product("Stairway to Heaven", ProductType.DIGITAL, 5.00)
        val order = Order(Customer(), Address())
        order.addProduct(music, 1)
        val orderItem = order.getItems().first()

        digitalTreatment.execute(order, orderItem)

        verify(exactly = 1) { voucherService.generateTo(order.customer, 10) }
        verify(exactly = 1) { emailService.send(order.customer, orderItem) }
    }

}