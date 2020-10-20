package ports

import core.order.Voucher

interface VoucherDeliveryInterface {
    fun createVoucher(): Voucher
}