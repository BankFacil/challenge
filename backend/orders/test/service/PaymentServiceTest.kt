package service

import challenge.model.*
import challenge.service.PaymentService
import challenge.service.paymentstrategy.PaymentDigitalStrategy
import org.junit.Test
import kotlin.test.assertNotNull

class PaymentServiceTest {

    private val paymentService = PaymentService()

    private val order = Order(Customer("Henry", "Henry@email.com"), Address())

    @Test(expected = Exception::class)
    fun processPaymentWhenOrderAlreadyHasPayment_then_ShouldThrowException() {
        val shirt = Product(PRODUCT_NAME, ProductType.PHYSICAL, PRODUCT_PRICE)
        order.addProduct(shirt, PRODUCT_QUANTITY, PaymentDigitalStrategy())
        order.payment = Payment(order, CreditCard(CREDIT_CARD))

        paymentService.processPayment(CreditCard(CREDIT_CARD), order)
    }

    @Test(expected = Exception::class)
    fun processPaymentWhenOrderHasNoProducts_then_ShouldThrowException() {
        paymentService.processPayment(CreditCard(CREDIT_CARD), order)
    }

    @Test
    fun processPaymentWithValidInfo_then_OrderShouldBeClosedAccordingly() {
        val shirt = Product(PRODUCT_NAME, ProductType.PHYSICAL,PRODUCT_PRICE)
        order.addProduct(shirt, PRODUCT_QUANTITY, PaymentDigitalStrategy())
        paymentService.processPayment(CreditCard(CREDIT_CARD), order)

        assertNotNull(order.closedAt)
    }

    @Test(expected = Exception::class)
    fun processPaymentWithDuplicatedProduct_then_ShouldThrowException() {
        val shirt = Product(PRODUCT_NAME, ProductType.PHYSICAL,PRODUCT_PRICE)
        val shirt2 = Product(PRODUCT_NAME, ProductType.PHYSICAL,PRODUCT_PRICE)
        order.addProduct(shirt, PRODUCT_QUANTITY, PaymentDigitalStrategy())
        order.addProduct(shirt2, PRODUCT_QUANTITY, PaymentDigitalStrategy())
        paymentService.processPayment(CreditCard(CREDIT_CARD), order)
    }

    companion object {
        const val CREDIT_CARD = "12312312312"
        const val PRODUCT_NAME = "Flowered t-shirt"
        const val PRODUCT_PRICE = 35.00
        const val PRODUCT_QUANTITY = 1
    }
}