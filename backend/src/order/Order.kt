package challenge.order

import challenge.customer.*
import challenge.payment.*
import product.DataProduct
import java.lang.Exception
import java.util.*

class Order(val customer: Customer, val address: Address) {
    val items = mutableListOf<OrderItem>()
    var closedAt: Date? = null
        private set
    var dataPayment: payment.DataPayment? = null
        private set
    val totalAmount
        get() = items.sumByDouble { it.total }
    var voucherDiscount = 0.0

    fun addProduct(dataProduct: DataProduct, quantity: Int) {
        val productAlreadyAdded = items.any { it.dataProduct == dataProduct }
        if (productAlreadyAdded)
            throw Exception("The dataProduct have already been added. Change the amount if you want more.")

        voucherDiscount += dataProduct.type.checkDiscount()

        items.add(OrderItem(dataProduct, quantity))
    }

    fun pay(method: PaymentMethod) {
        if (dataPayment != null)
            throw Exception("The order has already been paid!")

        if (items.count() == 0)
            throw Exception("Empty order can not be paid!")

        dataPayment = payment.DataPayment(this, method)

        close()
    }

    fun actionsAfterPayments(){
        for (i in items){
            i.dataProduct.execution = i.dataProduct.type.execute(i.dataProduct.name, i.quantity, i.total)
        }
    }

    private fun close() {
        closedAt = Date()
    }
}
