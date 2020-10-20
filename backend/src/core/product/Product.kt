package core.product

import ports.DeliveryInterface

abstract class Product(open val name: String, val type: ProductType, open val price: Double){
    abstract fun getDelivery(): DeliveryInterface
}