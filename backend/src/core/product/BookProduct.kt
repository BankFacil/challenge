package core.product

import config.DependenciesConfig
import ports.DeliveryInterface

class BookProduct (
    override val name: String,
    override val price: Double,
    private val delivery: DeliveryInterface = DependenciesConfig.BookProductDelivery()
):
    Product(name = name, type = ProductType.BOOK, price = price){

    override fun getDelivery(): DeliveryInterface {
        return delivery
    }
}