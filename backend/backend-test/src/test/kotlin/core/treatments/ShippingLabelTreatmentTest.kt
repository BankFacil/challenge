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

internal class ShippingLabelTreatmentTest{

    val shippingService: ShippingService = spyk<ShippingServiceAdapter>()

    val shippingLabelTreatment = ShippingLabelTreatment(shippingService)

    @Test
    fun `given an order and order item should call shipping service with disable free tax`() {
        val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
        val order = Order(Customer(), Address())
        order.addProduct(shirt, 1)
        val orderItem = order.getItems().first()

        shippingLabelTreatment.execute(order, orderItem)

        verify(exactly = 1) { shippingService.ship(orderItem, false) }
    }
}