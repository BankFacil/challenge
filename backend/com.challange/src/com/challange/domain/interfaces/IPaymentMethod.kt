package com.challange.domain.interfaces

import com.challange.domain.entities.Customer
import com.challange.domain.enum.ETypeOfPayment
import java.util.*

interface IPaymentMethod {
    var customer: Customer
    var paidDate: Date
    var expireDate: Date
    var typeOfPayment: ETypeOfPayment
    var totalPaid: Double
}