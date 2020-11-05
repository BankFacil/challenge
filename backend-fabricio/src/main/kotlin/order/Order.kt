package order

import main.BusinessException
import shipping.ShippingLabel
import java.util.*

class Order(val customer: Customer) {
    private val internalItems = mutableListOf<OrderItem>()
    val id: UUID = UUID.randomUUID()
    val items : List<OrderItem> =  internalItems

    var payment: Payment? = null
        private set

    fun addProduct(product: Product, quantity: Int) {
        validateIfProductAlreadyAdded(product)

        internalItems.add(OrderItem(product, quantity))
    }

    fun pay(method: PaymentMethod) {
        validateIfOrderIsEmpty()

        payment = Payment(this, method)
        PaymentService.execute(payment!!)
    }

    private fun validateIfProductAlreadyAdded(product: Product) {
        var productAlreadyAdded = items.any { it.product == product }
        if (productAlreadyAdded)
            throw BusinessException("The product have already been added. Change the amount if you want more.")
    }

    private fun validateIfOrderIsEmpty() {
        if (internalItems.count() == 0)
            throw BusinessException("Empty order can not be paid!")
    }
}