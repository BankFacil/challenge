package challenge.model

import challenge.service.paymentstrategy.PaymentStrategy
import java.lang.Exception
import java.util.*

data class Order(val customer: Customer, val address: Address) {
    val items = mutableListOf<OrderItem>()
    val paymentStrategies = mutableListOf<PaymentStrategy>()
    var closedAt: Date? = null
        private set
    var payment: Payment? = null
    val totalAmount
        get() = items.sumByDouble { it.total }

    fun addProduct(product: Product, quantity: Int, paymentStrategy: PaymentStrategy) {
        val productAlreadyAdded = items.any { it.product == product }
        if (productAlreadyAdded)
            throw Exception(DUPLICATED_PRODUCT_EXCEPTION_MESSAGE)

        items.add(OrderItem(product, quantity))
        paymentStrategies.add(paymentStrategy)
    }

    fun close() {
        closedAt = Date()
    }

    override fun toString(): String = "Items: " + this.items + " Total Price: " + totalAmount;

    companion object {
        const val DUPLICATED_PRODUCT_EXCEPTION_MESSAGE = "The product have already been added. Change the amount if you want more."
    }
}

