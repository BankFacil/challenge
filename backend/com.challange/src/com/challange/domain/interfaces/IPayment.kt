package com.challange.domain.interfaces

import com.challange.domain.entities.OrderItem
import com.challange.domain.enum.ETypeOfPayment

interface IPayment {
    fun pay(orderItem: OrderItem)
}