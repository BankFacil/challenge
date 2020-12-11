package com.challange.domain.entities

import com.challange.domain.enum.ETypeOfPayment
import com.challange.domain.interfaces.IPayment
import com.challange.domain.interfaces.IPaymentMethod
import com.sun.istack.internal.NotNull
import java.util.*

open class Payment(
        @NotNull override var customer: Customer,
        @NotNull override var paidDate: Date,
        @NotNull override var expireDate: Date,
        @NotNull override var typeOfPayment: ETypeOfPayment,
        @NotNull override var totalPaid: Double) : IPaymentMethod, IPayment {


    var paymentNumber: String = Math.random().toString().toUpperCase()

    override fun pay(orderItem: OrderItem) {
        when(this.typeOfPayment) {
            ETypeOfPayment.CREDITCARD -> {
                val creditCardPayment = CreditCardPayment("1234567890",
                        "HEITOR R SOUZA",
                        Date(),
                        "12345",
                        this.customer,
                        this.paidDate,
                        this.expireDate,
                        this.typeOfPayment,
                        this.totalPaid)

                creditCardPayment.pay(orderItem)
            }
        }
    }
}