package adapters

import core.customer.Customer
import ports.VoucherService

class VoucherServiceAdapter: VoucherService {
    override fun generateTo(customer: Customer, discount: Int) {
        println("Generating discount voucher for the customer $customer with value of R$ $discount.")
    }

}