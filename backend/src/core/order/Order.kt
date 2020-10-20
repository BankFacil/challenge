package core.order

import core.customer.Address
import core.payment.Payment
import ports.PaymentMethod
import core.product.Product
import core.customer.Customer
import core.deliver.Delivery
import java.lang.Exception
import java.util.*

class Order(val customer: Customer, val address: Address) {
    val id: UUID = UUID.randomUUID()
    private val items = mutableListOf<OrderItem>()
    var closedAt: Date? = null
        private set
    var payment: Payment? = null
        private set
    val totalAmount
        get() = items.sumByDouble { it.total }

    fun getItems(): List<OrderItem> = items

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
    }

    fun deliver(){
        Delivery.delivery(this)
        close()
    }

    private fun close() {
        closedAt = Date()
    }

    override fun toString(): String {
        var sb: StringBuilder = StringBuilder()
        sb.appendln("Order ID: ${this.id}")
        sb.append("Cliente: ${this.customer.name}")
        sb.appendln("Itens:")
        sb.appendln("\t name \t price \t quantity \t total")
        for (item in items){
            sb.appendln("\t name: ${item.product.name} \t quantity: ${item.quantity} \t price: ${item.product.price} \t ${item.total}")
        }
        sb.appendln("\t \t \t \t ${this.totalAmount}")
        return sb.toString()
    }
}
