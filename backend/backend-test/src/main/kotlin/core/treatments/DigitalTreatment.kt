package core.treatments

import adapters.EmailServiceAdapter
import adapters.VoucherServiceAdapter
import core.order.Order
import core.order.OrderItem
import ports.EmailService
import ports.VoucherService

class DigitalTreatment(private val voucherService: VoucherService, private val emailService: EmailService) : Treatment {
    override fun execute(order: Order, item: OrderItem) {
        voucherService.generateTo(order.customer, 10)
        emailService.send(order.customer, item)
    }

    companion object {
        fun treatment() = DigitalTreatment(VoucherServiceAdapter(), EmailServiceAdapter())
    }

}