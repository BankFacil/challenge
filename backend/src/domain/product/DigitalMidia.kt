package domain.product

class DigitalMidia(name: String, price: Double) : Product(name, price) {

    override var voucher: Double = 10.0
    override var taxFree: Boolean = true
    override var shippingLabelCreated: Boolean = false
    override var createdVoucher: Boolean = false

    override fun processShipping() {
        sendEmail("Thanks for buying $name")
        generateVoucher(voucher)
        createdVoucher = true
    }
}