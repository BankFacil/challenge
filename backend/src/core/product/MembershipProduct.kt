package core.product

import config.DependenciesConfig
import ports.DeliveryInterface

class MembershipProduct (
    override val name: String,
    override val price: Double,
    private val delivery: DeliveryInterface = DependenciesConfig.MembershipProductDelivery()
):
    Product(name = name, type = ProductType.MEMBERSHIP, price = price){

    override fun getDelivery(): DeliveryInterface {
        return delivery
    }
}