package core.deliver

import core.order.Order

object Delivery {
    fun delivery(order: Order){
        for(item in order.getItems()){
            var productDelivery = item.product.getDelivery()
            productDelivery.deliver(order, item.product, item.quantity)
        }
    }
}