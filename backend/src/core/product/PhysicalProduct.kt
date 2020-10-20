package core.product

import config.DependenciesConfig
import ports.DeliveryInterface

class PhysicalProduct (
    override val name: String,
    override val price: Double,
    private val delivery: DeliveryInterface = DependenciesConfig.PhysicalProductDelivery()
):
    Product(name = name, type = ProductType.PHYSICAL, price = price){

    override fun getDelivery(): DeliveryInterface {
        return delivery
    }
}