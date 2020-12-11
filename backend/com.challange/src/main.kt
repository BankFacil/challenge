import com.challange.domain.entities.Order
import com.challange.domain.entities.Product
import com.challange.domain.entities.*
import com.challange.domain.enum.*
import com.challange.domain.valueObjects.*
import java.util.*


fun main() {
    var address = Address("Brasil",
            "São Paulo",
            "São Paulo",
            "Residencial Parque",
            "Gaspar Sanches",
            "1812000")

    var customer = Customer(name = "Heitor", lastName = "Souza", document = "55555555555", address = address, email = "test@tes.com")

    val shirt = Product("Flowered t-shirt", 2.0, EProductType.PHYSICAL, 1)
    val netflix = Product("Familiar plan", 29.90, EProductType.MEMBERSHIP, 1)
    val book = Product("The Hitchhiker's Guide to the Galaxy", 120.00, EProductType.BOOK, 2)
    val music = Product("Stairway to Heaven", 5.00, EProductType.DIGITAL, 1)

    var orderItem = OrderItem()
    orderItem.addProduct(shirt)
    orderItem.addProduct(netflix)
    orderItem.addProduct(book)
    orderItem.addProduct(music)

    var payment = Payment(customer, Date(), Date(), ETypeOfPayment.CREDITCARD, orderItem.totalPaid)

    val order = Order(customer, orderItem, payment)
    order.executePayment()
    order.generateThreatment()
    // now, how to deal with shipping rules then?
}

