package challenge.domain.product.strategy

import challenge.domain.customer.Customer
import challenge.domain.email.Email
import challenge.domain.email.SendEmail
import challenge.domain.order.Voucher
import challenge.domain.product.Digital
import challenge.domain.product.Product

object DigitalCheckout : CheckoutStrategy {

    override fun checkout(product: Product, customer: Customer): Product {
        println("DigitalCheckout.checkout(); Product: ${product.name}. Customer: ${customer.name}") //logger
        product as Digital
        val voucher = Voucher.createVoucher(10.0, customer)
        sendEmail(product, customer, voucher)
        return product
    }

    private fun sendEmail(product: Product, customer: Customer, voucher: Double){
        val bodyEmail = """Você comprou o produto ${product.name}.
            | Concedemos um voucher de desconto no valor de R$ $voucher
            | 
            | Obrigado Sr(a) ${customer.name}
        """.trimMargin()
        val email = Email(customer.email, "Ativação de assinatura", bodyEmail)
        SendEmail.sendEmail(email)
    }


}