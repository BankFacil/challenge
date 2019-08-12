package domain.order

import domain.address.Address
import domain.customer.Customer
import domain.payment.Payment
import domain.payment.PaymentMethod
import domain.product.Product
import java.util.*

data class Order(
        val customer: Customer,
        val address: Address,
        val closedAt: Date?,
        val payment: Payment?,
        val items: MutableList<OrderItem> = mutableListOf()
) {

    fun totalAmount() = items.sumByDouble { it.total }

    fun addProduct(product: Product, quantity: Int) {
        val productAlreadyAdded = items.any { it.product == product }
        if (productAlreadyAdded)
            throw Exception("The product have already been added. Change the amount if you want more.")

        items.add(OrderItem(product, quantity))
    }

    fun pay(method: PaymentMethod): Order {
        if (payment != null)
            throw Exception("The order has already been paid!")

        if (items.count() == 0)
            throw Exception("Empty order can not be paid!")

        return this.copy(
                payment = Payment(this, method),
                closedAt = Date()
        )
    }
}