package challenge.domain.order

import challenge.domain.customer.Customer

object Voucher {

    fun createVoucher (amountVoucher: Double, customer: Customer ): Double {
        //poderia associar voucher ao cliente na base de dados.
        return amountVoucher
    }
}
