package com.challange.domain.entities

import com.challange.domain.interfaces.IOrderItem

class OrderItem : IOrderItem {

    var productsAdded: MutableList<Product> = mutableListOf()
    var totalPaid: Double = 0.0

    override fun addProduct(product: Product) {
        this.calculateTotalPaid(product.quantity, product.price)

        if(this.productsAdded.contains(product)) {
            throw Exception("The product have already been added. Change the amount if you want more.")
        }

        this.productsAdded.add(product)
    }

    override fun calculateTotalPaid(quantity: Int, price: Double) {
        this.totalPaid += quantity * price
    }
}