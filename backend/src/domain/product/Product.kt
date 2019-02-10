package domain.product

abstract class Product(
    var name: String,
    var price: Double){

    abstract var voucher: Double
        protected set
    abstract var taxFree: Boolean
        protected set
    abstract var shippingLabelCreated: Boolean
        protected set
    abstract var createdVoucher: Boolean
        protected set

    abstract fun processShipping()

    fun sendEmail(content: String) {
        println("email sent: $content")
    }

    fun generateShippingLabel() {
        println("shipping label generated.")
    }

    fun generateVoucher(amount: Double) {
        println("Voucher created - $amount")
    }
}