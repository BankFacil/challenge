package challenge.service.paymentstrategy

import challenge.model.Payment
import challenge.model.ProductType
import challenge.service.EmailService
import challenge.service.SignatureService

class PaymentServiceSignatureStrategy: PaymentStrategy {

    private val signatureService = SignatureService()
    private val emailService = EmailService()

    override fun pay(payment: Payment) {
        val signatureItems = payment.order.items.filter { it.product.type == ProductType.MEMBERSHIP }
        val customer = payment.order.customer;

        val activationResponse = signatureService.activateSignature(customer = customer, items = signatureItems)

        emailService.sendEmail(customer = customer, items = signatureItems, notification = activationResponse)
    }
}