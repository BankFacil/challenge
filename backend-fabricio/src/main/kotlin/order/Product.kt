package order

abstract class Product(val name: String, val price: Double) {
    abstract fun pay(payment: Payment)

    override fun equals(other: Any?): Boolean {
        if(other == null || other !is Product)
            return false
        return name == other.name && price == other.price
    }
}