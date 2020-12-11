package challenge

fun main(args : Array<String>) {
    val shirt = PhysicalProduct("Flowered t-shirt", 35.00)
    val jeans = PhysicalProduct("Black Jeans", 85.00)
    val netflix = Membership("Familiar plan", 29.90)
    val book = BookProduct("The Hitchhiker's Guide to the Galaxy", 120.00)
    val music = DigitalProduct("Stairway to Heaven", 5.00)

    val customer = Customer("John", "john@outlook.com")
    val order = Order(customer, Address())

    order.addProduct(shirt, 2)
    order.addProduct(jeans, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    order.pay(CreditCard("43567890-987654367"))
    order.deliverItems()
}