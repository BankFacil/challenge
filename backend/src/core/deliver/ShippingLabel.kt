package core.deliver

import core.order.Order
import java.util.UUID

data class ShippingLabel(val order: Order){
    val id: UUID = UUID.randomUUID()
    var notification: Notification? = null
        set(value){
            field = value
        }
        get(){
            if(notification == null)
                return Notification("")
            return field
        }
}