package core.treatments

import adapters.ShippingServiceAdapter
import core.customer.Address
import core.customer.Customer
import core.order.Order
import core.order.Product
import core.order.ProductType
import io.mockk.spyk
import io.mockk.verify
import org.junit.jupiter.api.Test
import ports.ShippingService

internal class ShippingLabelFreeTaxTreatmentTest {

    val shippingService: ShippingService = spyk<ShippingServiceAdapter>()

    val shippingLabelFreeTaxTreatment = ShippingLabelFreeTaxTreatment(shippingService)

    @Test
    fun `given an order and order item should call shipping service with enable free tax`() {
        val book = Product("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00)
        val order = Order(Customer(), Address())
        order.addProduct(book, 1)
        val orderItem = order.getItems().first()

        shippingLabelFreeTaxTreatment.execute(order, orderItem)

        verify(exactly = 1) { shippingService.ship(orderItem, true) }
    }
}