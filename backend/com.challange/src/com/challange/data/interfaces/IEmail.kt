package com.challange.data.interfaces

import com.challange.domain.entities.Customer
import com.challange.domain.entities.Product

interface IEmail {
    fun sendEmail(customer: Customer, product: Product)
}