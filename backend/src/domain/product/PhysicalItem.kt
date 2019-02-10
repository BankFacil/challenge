package domain.product

class PhysicalItem(name: String, price: Double) : Product(name, price) {

    override var voucher: Double = 0.0
    override var taxFree: Boolean = false
    override var shippingLabelCreated: Boolean = false
    override var createdVoucher: Boolean = false

    override fun processShipping() {
        generateShippingLabel()
        shippingLabelCreated = true
    }
}