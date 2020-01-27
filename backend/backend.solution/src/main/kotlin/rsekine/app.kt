package rsekine

import challenge.*

fun generateOrder() : Order{
    val shirt = Product("Flowered t-shirt", ProductType.PHYSICAL, 35.00)
    val netflix = Product("Familiar plan", ProductType.MEMBERSHIP, 29.90)
    val book = Product("The Hitchhiker's Guide to the Galaxy", ProductType.BOOK, 120.00)
    val music = Product("Stairway to Heaven", ProductType.DIGITAL, 5.00)

    val order = Order(
        Customer("Ricardo Vilas Boas Sekine", "ricardo.vbsekine@gmail.com"),
        Address("Rua Sem saída, nº 50 - Bairro ZeroUm - Cidade de Gigabyte / GB"))

    order.addProduct(shirt, 2)
    order.addProduct(netflix, 1)
    order.addProduct(book, 1)
    order.addProduct(music, 1)

    return order;
}

