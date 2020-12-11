package challenge


data class Voucher(val value : Double)
data class ShippingLabel(val order : Order, val description : String) {}

/**
 * Handles the delivery process of the [order]
 */
class DeliveryManagement(private val order : Order) {

    /**
     * Process the delivery of each item
     */
    fun process() {
        for (item in this.order.items) {
            this.deliverItem(item.product, item.quantity)
        }
    }

    private fun deliverItem(product: Product, quantity : Int) {
        val deliveryRule = product.getDeliveryRule()
        deliveryRule.deliver(product, quantity, order)
    }
}

class DigitalDeliveryRule : DeliveryRuleInterface, NotifyDeliveryInterface, GnerateVoucherInterface {
    override fun deliver(product: Product, quantity: Int, order : Order) {
        this.sendNotification(order.customer, product)
    }
    override fun sendNotification(customer : Customer, product : Product) {
        val notification = SimpleNotification(
                "Congratulations you won a Voucher of" + this.generateVoucher(10.0).toString()
        )
        EmailNotificator(customer.email).send(notification)
    }
    override fun generateVoucher(value: Double) : Voucher {
        return Voucher(value)
    }
}

class MembershipDeliveryRule : DeliveryRuleInterface, NotifyDeliveryInterface {
    override fun deliver(product: Product, quantity: Int, order : Order) {
        this.sendNotification(order.customer, product)
        val membership = CustomerMembership(order.customer, product as Membership, MemberShipStatus.ACTIVE)
        // Do something with the activated membership
    }
    override fun sendNotification(customer : Customer, product : Product) {
        val notification = SimpleNotification(
                "Thank you! Your membership is already active!"
        )
        EmailNotificator(customer.email) .send(notification)
    }
}

/**
 * You may choose to [createShippingLabel] with a [description]
 */
open class PhysicalDeliveryRule() : DeliveryRuleInterface, ShippableInterface {
    override fun deliver(product: Product, quantity: Int, order : Order) {
        this.createShippingLabel(order, "")
    }

    override fun createShippingLabel(order : Order, description : String) : ShippingLabel {
        return ShippingLabel(order, description)
    }
}

class BookDeliveryRule() : PhysicalDeliveryRule() {
    override fun createShippingLabel(order : Order, description : String) : ShippingLabel {
        return super.createShippingLabel(order, "$description; tax-exempt")
    }
}

interface DeliveryRuleInterface {
    /**
     * Process the delivery of a [quantity] of [product] to a [order]
     */
    fun deliver(product : Product, quantity : Int, order : Order)
}

interface NotifyDeliveryInterface {
    /**
     * Send a notification to the [customer] about the [product]
     */
    fun sendNotification(customer : Customer, product : Product)
}

interface ShippableInterface {
    /**
     * Create the shipping label with a given [description]
     */
    fun createShippingLabel(order : Order, description : String) : ShippingLabel
}

interface GnerateVoucherInterface {
    /**
     * Generate a voucher with giver [value]
     */
    fun generateVoucher(value : Double) : Voucher
}