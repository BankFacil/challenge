package com.challange.domain.entities

import com.challange.domain.valueObjects.Address

class Customer(val name: String,
               val lastName: String,
               val document: String,
               val address: Address,
               val email: String) {
    val subscriptions: Subscriptions = Subscriptions()
}