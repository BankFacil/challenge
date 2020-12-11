package com.challange.domain.interfaces

import com.challange.domain.entities.Product

interface IOrderItem {
    fun addProduct(product: Product)
    fun calculateTotalPaid(quantity: Int, price: Double)
}