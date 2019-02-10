package domain.product

class Book(name: String, price: Double) : Product(name, price) {

    override var voucher: Double = 0.0
    override var taxFree: Boolean = true
    override var shippingLabelCreated: Boolean = false
    override var createdVoucher: Boolean = false

    override fun processShipping() {
        generateShippingLabel()
        sendEmail("item free of taxes")
        shippingLabelCreated = true
    }
}