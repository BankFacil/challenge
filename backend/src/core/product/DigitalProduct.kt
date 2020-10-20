package core.product

import config.DependenciesConfig
import ports.DeliveryInterface

class DigitalProduct (
    override val name: String,
    override val price: Double,
    private val delivery: DeliveryInterface = DependenciesConfig.DigitalProductDelivery()
):
    Product(name = name, type = ProductType.DIGITAL, price = price){

    override fun getDelivery(): DeliveryInterface {
        return delivery
    }
}