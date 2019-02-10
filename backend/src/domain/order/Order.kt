package domain.order

import domain.customer.Address
import domain.customer.Customer
import domain.payment.Payment
import domain.payment.PaymentMethod
import domain.product.Product
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

    fun processShipping() {
        items.forEach { item: OrderItem -> item.product.processShipping() }
    }

    fun applyDiscounts() {
        customer.totalDiscount = items.sumByDouble { item -> item.product.voucher }
    }

    private fun close() {
        closedAt = Date()
    }
}