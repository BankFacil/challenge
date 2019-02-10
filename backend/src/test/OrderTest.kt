package test

import domain.customer.Address
import domain.customer.Customer
import domain.order.Order
import domain.payment.CreditCard
import domain.product.Book
import domain.product.DigitalMidia
import domain.product.PhysicalItem
import domain.product.ServiceSubscription
import org.junit.jupiter.api.Test
import java.lang.Exception
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class OrderTest {

    @Test
    fun createOrderWithDigitalMidiaCustomerShouldRecieveDiscount() {
        val music = DigitalMidia("Stairway to Heaven", 5.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(music, 2)
        order.applyDiscounts()

        assertEquals(10.0, customer.totalDiscount)
    }

    @Test
    fun addRepeatedProductShouldThrowException() {
        assertFailsWith(Exception::class, "The product have already been added. Change the amount if you want more.") {
            val music = DigitalMidia("Stairway to Heaven", 5.00)
            val customer = Customer("John")
            val order = Order(customer, Address("Bourbon Street"))

            order.addProduct(music, 2)
            order.addProduct(music, 2)
        }
    }

    @Test
    fun addProductShouldInsertInItemsList() {
        val music = DigitalMidia("Stairway to Heaven", 5.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(music, 2)

        assert(order.items.any { item -> item.product.name == music.name })
    }

    @Test
    fun payAlreadyPaidOrderShouldThrowException() {
        assertFailsWith(Exception::class, "The order has already been paid!") {
            val music = DigitalMidia("Stairway to Heaven", 5.00)
            val customer = Customer("John")
            val order = Order(customer, Address("Bourbon Street"))

            order.addProduct(music, 2)
            order.pay(CreditCard("43567890-987654367"))
            order.pay(CreditCard("43567890-987654367"))
        }
    }

    @Test
    fun payEmptyOrderShouldThrowException() {
        assertFailsWith(Exception::class, "Empty order can not be paid!") {
            val customer = Customer("John")
            val order = Order(customer, Address("Bourbon Street"))

            order.pay(CreditCard("43567890-987654367"))
        }
    }

    @Test
    fun payOrderShouldCreatePayment() {
        val music = DigitalMidia("Stairway to Heaven", 5.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))
        val payment = CreditCard("43567890-987654367")

        order.addProduct(music, 2)
        order.pay(payment)

        assertEquals(order.totalAmount, order.payment?.amount)
    }

    @Test
    fun processShippingForPhysicalItemShouldGenerateShippingLabel() {
        val shirt = PhysicalItem("Flowered t-shirt", 35.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(shirt, 1)
        order.pay(CreditCard("43567890-987654367"))
        order.processShipping()

        val item = order.items.first().product as PhysicalItem
        assert(item.shippingLabelCreated)
    }

    @Test
    fun processShippingForServiceSubscriptionShouldActivateProduct() {
        val netflix = ServiceSubscription("Familiar plan", 29.90)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(netflix, 1)
        order.pay(CreditCard("43567890-987654367"))
        order.processShipping()

        val item = order.items.first().product as ServiceSubscription
        assert(item.active)
    }

    @Test
    fun processShippingForBookShouldBeTaxFreeAndGenerateShippingLabel() {
        val book = Book("The Hitchhiker's Guide to the Galaxy", 120.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(book, 1)
        order.pay(CreditCard("43567890-987654367"))
        order.processShipping()

        val item = order.items.first().product as Book
        assert(item.shippingLabelCreated)
        assert(item.taxFree)
    }

    @Test
    fun processShippingForDigitalMidiaShouldGenerateVoucher() {
        val music = DigitalMidia("Stairway to Heaven", 5.00)
        val customer = Customer("John")
        val order = Order(customer, Address("Bourbon Street"))

        order.addProduct(music, 1)
        order.pay(CreditCard("43567890-987654367"))
        order.processShipping()

        val item = order.items.first().product as DigitalMidia
        assert(item.createdVoucher)
    }
}