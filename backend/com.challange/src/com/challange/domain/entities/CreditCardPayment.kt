package com.challange.domain.entities

import com.challange.domain.enum.ETypeOfPayment
import com.challange.domain.interfaces.IPayment
import com.challange.domain.interfaces.IPaymentMethod
import java.lang.Exception
import java.util.*

class CreditCardPayment(var creditCardNumber: String,
                        var creditCardName: String,
                        var expireCreditCardDate: Date,
                        var cvv: String,
                        override var customer: Customer,
                        override var paidDate: Date,
                        override var expireDate: Date,
                        override var typeOfPayment: ETypeOfPayment,
                        override var totalPaid: Double) : IPaymentMethod, IPayment {

    override fun pay(orderItem: OrderItem) {
        if (orderItem.productsAdded.count() == 0)
            throw Exception("Empty order can not be paid!")
    }
}