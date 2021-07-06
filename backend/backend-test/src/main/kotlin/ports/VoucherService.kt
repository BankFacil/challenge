package ports

import core.customer.Customer

interface VoucherService {
    fun generateTo(customer: Customer, discount: Int)
}