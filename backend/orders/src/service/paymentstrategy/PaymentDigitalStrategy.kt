package challenge.service.paymentstrategy

import challenge.model.DiscountVoucher
import challenge.model.Payment
import challenge.model.ProductType
import challenge.service.EmailService

class PaymentDigitalStrategy: PaymentStrategy {

    private val emailService = EmailService()

    override fun pay(payment: Payment) {
        val signatureItems = payment.order.items.filter { it.product.type == ProductType.DIGITAL }
        val customer = payment.order.customer;

        val voucher = DiscountVoucher(customer = customer, value = DISCOUNT_VALUE)

        emailService.sendEmail(customer = customer, items = signatureItems, notification = EMAIL_NOTIFICATION + voucher)
    }

    companion object {
        private const val DISCOUNT_VALUE = 10.0
        private const val EMAIL_NOTIFICATION = "You have received a Discount voucher: "
    }
}