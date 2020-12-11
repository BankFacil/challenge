package com.challange.domain.entities

import com.challange.domain.enum.EProductType

class Product(val name: String, val price: Double, val typeOfProduct: EProductType, var quantity: Int) {}