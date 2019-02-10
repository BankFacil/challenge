package domain.product

class ServiceSubscription(name: String, price: Double) : Product(name, price) {

    override var voucher: Double = 0.0
    override var taxFree: Boolean = false
    override var shippingLabelCreated: Boolean = false
    override var createdVoucher: Boolean = false
    var active: Boolean = false

    override fun processShipping() {
        activate()
    }

    private fun activate() {
        active = true
        sendEmail("Subscription activated - $name")
    }
}