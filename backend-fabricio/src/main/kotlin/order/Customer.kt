package order

import main.BusinessException

class Customer {
    var totalVoucher: Double = 0.0
        private set

    fun grantVoucherDiscount(discountVoucher: Double) {

        validateIfDiscountIsLessThanZero(discountVoucher)

        totalVoucher += discountVoucher
    }

    private fun validateIfDiscountIsLessThanZero(discountVoucher: Double) {
        if (discountVoucher < 0)
            throw BusinessException("Discount must be greater than zero!")
    }
}