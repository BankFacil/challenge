package challenge.order

import challenge.customer.*
import challenge.payment.CreditCard
import challenge.product.*
import org.junit.Assert
import org.junit.Test
import product.DataProduct


class OrderTest {

    @Test fun testCreateOrder(){
        val shirt = DataProduct("Flowered t-shirt", ProductType.PHYSICAL, 35.00, null)
        val netflix = DataProduct("Netflix (Familiar plan)", ProductType.MEMBERSHIP, 30.90, null)
        val book = DataProduct("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00, null)
        val music = DataProduct("Stairway to Heaven (Digital Music)", ProductType.DIGITAL, 10.00, null)

        val order = Order(Customer(), Address())

        order.addProduct(shirt, 2)
        order.addProduct(netflix, 1)
        order.addProduct(book, 1)
        order.addProduct(music, 1)

        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        for (i in order.items){
            println(i.dataProduct.name)
            println("shippingLabel: ${i.dataProduct.execution?.shippingLabelId}")
            println("emailStatus: ${i.dataProduct.execution?.emailStatus}")
            println("notification: ${i.dataProduct.execution?.notification}")
            println(" ")
        }

        Assert.assertTrue(230.9==order.totalAmount)
        Assert.assertTrue(10.0==order.voucherDiscount)

    }

    @Test fun testDigitalVoucherDiscount(){

        val music1 = DataProduct("Take Me To Church (Digital Music)", ProductType.DIGITAL, 10.00, null)

        val order = Order(Customer(), Address())

        order.addProduct(music1, 10)


        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        for (i in order.items){
            println(i.dataProduct.name)
            println("shippingLabel: ${i.dataProduct.execution?.shippingLabelId}")
            println("emailStatus: ${i.dataProduct.execution?.emailStatus}")
            println("notification: ${i.dataProduct.execution?.notification}")
            println(" ")
        }

        Assert.assertTrue(10.0==order.voucherDiscount)


    }

    @Test fun testDigitalMultipleVoucherDiscountAndEmail() {

        val music1 = DataProduct("Take Me To Church (Digital Music)", ProductType.DIGITAL, 10.00, null)
        val music2 = DataProduct("Believer (Digital Music)", ProductType.DIGITAL, 5.00, null)

        val order = Order(Customer(), Address())

        order.addProduct(music2, 10)
        order.addProduct(music1, 5)


        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        for (i in order.items) {
            println(i.dataProduct.name)
            println("shippingLabel: ${i.dataProduct.execution?.shippingLabelId}")
            println("emailStatus: ${i.dataProduct.execution?.emailStatus}")
            println("notification: ${i.dataProduct.execution?.notification}")
            println(" ")
        }

        Assert.assertTrue(20.0 == order.voucherDiscount)
        val executionObject = Execution(null,true,"Compra Digital: Believer (Digital Music). Valor Total 50.0")
        Assert.assertTrue(executionObject == order.items.first().dataProduct.execution)

    }

    @Test fun testBookNotification(){
        val book = DataProduct("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00, null)

        val order = Order(Customer(), Address())

        order.addProduct(book, 1)

        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        val textNotification = "Item isento de impostos conforme disposto na Constituição Art. 150, VI, d."

        Assert.assertTrue(textNotification == order.items.first().dataProduct.execution?.notification)

    }

    @Test fun testPhysicalShippingLabel(){
        val book = DataProduct("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00, null)

        val order = Order(Customer(), Address())

        order.addProduct(book, 1)

        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        val textNotification = "Item isento de impostos conforme disposto na Constituição Art. 150, VI, d."

        Assert.assertTrue(order.items.first().dataProduct.execution?.shippingLabelId!! >= 1)

    }


    @Test fun testServiceSubscriber(){
        val netflix = DataProduct("Spotify (Family plan)", ProductType.MEMBERSHIP, 30.90, null)

        val order = Order(Customer(), Address())

        order.addProduct(netflix, 1)

        order.pay(CreditCard("43567890-987654367"))

        order.actionsAfterPayments()

        val executionObject = Execution( null, true, "Serviço Spotify (Family plan) ativado")

        Assert.assertTrue(executionObject == order.items.first().dataProduct.execution)

    }

}