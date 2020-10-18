package challenge

import challenge.model.PhysicalShipping
import challenge.model.SubscriptionShipping
import java.util.*

class Order(val customer: Customer, val address: Address) {

    val items = mutableListOf<OrderItem>()

    var closedAt: Date? = null
        private set
    var payment: Payment? = null
        private set
    val totalAmount
        get() = items.sumByDouble { it.total }

    fun addProduct(product: Product, quantity: Int) {
        var productAlreadyAdded = items.any { it.product == product }
        if (productAlreadyAdded)
            throw Exception("The product have already been added. Change the amount if you want more.")

        items.add(OrderItem(product, quantity))
    }

    fun pay(method: PaymentMethod) {
        if (payment != null)
            throw Exception("The order has already been paid!")

        if (items.count() == 0)
            throw Exception("Empty order can not be paid!")

        payment = Payment(this, method)

        close()
    }

    fun ship(){
        items.forEach { (item) ->
            run {
                when (item.type) {
                    ProductType.BOOK -> BookShipping().ship(item)
                    ProductType.DIGITAL -> DigitalShipping(customer).ship(item)
                    ProductType.PHYSICAL -> PhysicalShipping().ship(item)
                    ProductType.MEMBERSHIP -> SubscriptionShipping(customer).ship(item)
                }
            }
        }
    }

    private fun close() {
        closedAt = Date()
    }
}