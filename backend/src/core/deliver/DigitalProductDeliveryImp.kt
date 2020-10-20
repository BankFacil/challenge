package core.deliver

import config.DependenciesConfig
import core.order.Order
import core.order.Voucher
import core.product.Product
import ports.DeliveryInterface
import ports.MailSenderInterface
import ports.VoucherDeliveryInterface

class DigitalProductDeliveryImp(private val mailSender: MailSenderInterface = DependenciesConfig.MailSender()) :
    DeliveryInterface,
    MailSenderInterface,
    VoucherDeliveryInterface {
    override fun createVoucher(): Voucher {
        return Voucher(10.0)
    }

    override fun send(mail: Mail) {
        mailSender.send(mail)
    }

    override fun deliver(order: Order, product: Product, quantity: Int) {
        val voucher = createVoucher()
        val sb = StringBuilder()
        sb.appendln("Hi ${order.customer.name},")
        sb.appendln("You won a Voucher (${voucher.code}) of R$ ${voucher.value}")
        sb.appendln("Congratulations for your purchase... See the details:")
        sb.appendln(order.toString())
        val mail = Mail(
            order.customer,
            "Your order #${order.id}",
            sb.toString()
        )
    }
}