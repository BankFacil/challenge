package challenge.domain.product.strategy

import challenge.domain.customer.Customer
import challenge.domain.email.Email
import challenge.domain.email.SendEmail
import challenge.domain.product.Membership
import challenge.domain.product.Product

object MembershipCheckout : CheckoutStrategy {

    override fun checkout(product: Product, customer: Customer): Product {
        product as Membership
        println("MembershipCheckout.checkout(); Product: ${product.name}. Customer: ${customer.name}")
        sendEmail(product, customer)
        return product.copy(activated = true)
    }

    private fun sendEmail(product: Product, customer: Customer){
        val bodyEmail = """Você ativou o serviço ${product.name}.
            | 
            | Obrigado Sr(a) ${customer.name}
        """.trimMargin()

        val email = Email(customer.email, "Ativação de assinatura",bodyEmail)
        SendEmail.sendEmail(email)
    }

}