package com.challange.domain.interfaces

import com.challange.domain.entities.Product

interface IOrderInterface {
    fun executePayment()
    fun generateThreatment()
    fun activateSubscription(product: Product)
    fun generateShippingLabel(isARegularBook: Boolean)
    fun generateVoucher(product: Product)
}