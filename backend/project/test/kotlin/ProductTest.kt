package test

import challenge.domain.customer.Customer
import challenge.domain.product.*
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class ProductTest {

    private lateinit var membership: Product
    private lateinit var book: Product
    private lateinit var physical: Product
    private lateinit var digital: Product
    private val custumer: Customer = Customer("alan c.","alan@alan.com.br")

    @Before
    fun setUp(){
        membership = Membership("netflix", 120.00);
        physical = Physical("Flowered t-shirt", 35.00)
        book = Book("The Hitchhiker's Guide to the Galaxy", 120.00)
        digital = Digital("Stairway to Heaven", 5.00)
    }

    @Test
    fun bookCheckIfShippinglabelWasGenerated() {
        val product = book.getStrategy().checkout(book, custumer)
        Assert.assertEquals((product as Book).shippingLabel?.description,"Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.")
    }

    @Test
    fun membershipCheckIfIsActivated() {
        val product = membership.getStrategy().checkout(membership, custumer)
        Assert.assertTrue((product as Membership).activated)
    }

    @Test
    fun physicalCheckIfShippinglabelWasGenerated() {
        val product = physical.getStrategy().checkout(physical, custumer)
        Assert.assertEquals((product as Physical).shippingLabel?.description,"Deve ser colocado na caixa para envio.")
    }

}