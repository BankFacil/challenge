package core.order

import core.customer.Address
import core.customer.Customer
import core.payment.Payment
import core.payment.PaymentMethod
import java.lang.Exception
import java.util.*

class Order(val customer: Customer, val address: Address) {
    private val items = mutableListOf<OrderItem>()
    var closedAt: Date? = null
        private set
    var payment: Payment? = null
        private set
    val totalAmount
        get() = items.sumByDouble { it.total }

    fun addProduct(product: Product, quantity: Int) {
        val productAlreadyAdded = items.any { it.product == product }
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

        // Invoca a regra de cada tipo de produto atrelado a ordem
        items.forEach { it.product.type.treatment.execute(this, it) }

        close()
    }

    private fun close() {
        closedAt = Date()
    }

    fun getItems() = mutableListOf<OrderItem>().apply { addAll(items.map { it }) }
}













