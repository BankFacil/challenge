package challenge

import java.lang.Exception
import java.util.*
import javax.print.attribute.standard.Destination

/**
 * Classe Ordem, representa uma ordem de venda
 */
class Order(val customer: Customer, val address: Address) {

    private val items = mutableListOf<OrderItem>()
    var closedAt: Date? = null
        private set
    var payment: Payment? = null
        private set
    val totalAmount
        get() = items.sumByDouble { it.total }

    /**
     * Método responsável por adicionar um produto à ordem de venda
     */
    fun addProduct(product: Product, quantity: Int) {
        var productAlreadyAdded = items.any { it.product == product }
        if (productAlreadyAdded)
            throw Exception("The product have already been added. Change the amount if you want more.")

        items.add(OrderItem(product, quantity))
    }

    /**
     * Método responsável por realizar o pagamento da ordem de venda
     */
    fun pay(method: PaymentMethod) {
        if (payment != null)
            throw Exception("The order has already been paid!")

        if (items.count() == 0)
            throw Exception("Empty order can not be paid!")

        payment = Payment(this, method)

        close()
    }

    /**
     * Função responsável por chamar o despacho de cada item
     */
    fun dispathItems() {
        if(null != this.payment) {
            for(item in this.items) {
                ShippingFactory(this, item.product.name).getShipping(item.product).dispatch()
            }
        }
    }

    /**
     * Método responsável por fechar a ordem
     */
    private fun close() {
        closedAt = Date()
    }
}

/**
 * Classe OrdemItem, representa um Item a ser adicionado em uma ordem de venda
 */
data class OrderItem(val product: Product, val quantity: Int) {
    val total get() = product.price * quantity
}

/**
 * Classe Payment, representa o pagamento a ser usado em uma ordem de venda
 */
data class Payment(val order: Order, val paymentMethod: PaymentMethod) {
    val paidAt = Date()
    val authorizationNumber = paidAt.time
    val amount = order.totalAmount
    val invoice = Invoice(order)
}

/**
 * Classe CreditCard, é uma implementação de um PaymentMethod, representa o
 * tipo de pagamento cartão de crédito
 */
data class CreditCard(val number: String) : PaymentMethod

/**
 * Interface PaymentMethod representa um método de pagamento a ser usado em
 * um pagamento
 */
interface PaymentMethod

/**
 * Classe Invoice, representa os dados de fatura da Ordem
 */
data class Invoice(val order: Order) {
    val billingAddress: Address = order.address
    val shippingAddress: Address = order.address
}

/**
 * Classe Product, representa um produto a ser utilizado em um item de produto de uma
 * ordem de venda
 */
data class Product(val name: String, val type: ProductType, val price: Double)

/**
 * O enum ProductType contém todos tipos de produtos disponíveis
 */
enum class ProductType {
    PHYSICAL,
    BOOK,
    DIGITAL,
    MEMBERSHIP
}

data class Address(val description: String)
data class Customer(val name: String, val email: String)


/**
 * Classe abstrata Shipping, implementa métodos que podem ser usados por
 * classes concretas e deixa como abstrata a função de despacho, pois
 * cada tipo de produto possui uma forma diferente de tratar o despacho
 */
abstract class Shipping(private val order: Order, protected val productDescription: String) {

    fun printShippingLabel(obs: String) {
        println("####### printing shipping label #######")
        println("Produto: $productDescription")
        println("Cliente: ${this.order.customer.name}")
        println("Endereço: ${this.order.address.description}")
        println("Observações: $obs")
        println("####### label successfully printed #######")
    }

    fun sendEmail(subject: String, body: String) {
        println("####### sending email #######")
        println("Produto: $productDescription")
        println("Cliente: ${this.order.customer.name}")
        println("E-mail: ${this.order.customer.email}")
        println("Assunto: $subject")
        println("$body")
        println("####### email sent #######")
    }

    fun enableSubscription() {
        println("####### enabling subscription #######")
        println("Produto: $productDescription")
        println("Cliente: ${this.order.customer.name}")
        println("####### subscription enabled #######")
    }

    fun generateVoucher(voucherValue: String) {
        println("####### generating voucher #######")
        println("Produto: $productDescription")
        println("Cliente: ${this.order.customer.name}")
        println("Voucher R$ $voucherValue para próxima compra")
        println("####### generated voucher #######")
    }

    abstract fun dispatch()
}

/**
 * Classe concreta, implementa as regras de remessa para um produto do tipo PHYSICAL
 */
class PhysicalShipping(order: Order, productDescription: String) : Shipping(order, productDescription) {
    override fun dispatch() {
        super.printShippingLabel("")
        println()
    }
}

/**
 * Classe concreta, implementa as regras de remessa para um produto do tipo MERBERSHIP
 */
class MembershipShipping(order: Order, productDescription: String) : Shipping (order, productDescription) {
    override fun dispatch() {
        super.enableSubscription()
        super.sendEmail("Assinatura de serviço", "Sua assinatura para o serviço $productDescription foi ativada. Aproveite sua compra!")
        println()
    }
}

/**
 * Classe concreta, implementa as regras de remessa para um produto do tipo BOOK
 */
class BookShipping(order: Order, productDescription: String) : Shipping(order, productDescription) {
    override fun dispatch() {
        super.printShippingLabel("Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.")
        println()
    }
}

/**
 * Classe concreta, implementa as regras de remessa para um produto do tipo DIGITAL
 */
class DigitalShipping(order: Order, productDescription: String) : Shipping (order, productDescription) {
    override fun dispatch() {
        this.sendEmail("Compra de mídia digital", "Mídia digital adquida com sucesso: $productDescription. Aproveite sua compra!")
        this.generateVoucher("10,00")
        println()
    }
}

/**
 * Classe responsável por recuperar uma instancia correta da classe Shipping
 */
class ShippingFactory(private val order: Order, private val productDescription: String) {

    private val shippingMap = mapOf(
        ProductType.BOOK to BookShipping(order, productDescription),
        ProductType.PHYSICAL to PhysicalShipping(order, productDescription),
        ProductType.DIGITAL to DigitalShipping(order, productDescription),
        ProductType.MEMBERSHIP to MembershipShipping(order, productDescription))

    fun getShipping(product: Product) : Shipping = this.shippingMap.getOrDefault(product.type, PhysicalShipping(order, productDescription))

}