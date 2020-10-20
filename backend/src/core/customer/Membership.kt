package core.customer

import core.customer.Customer
import java.util.UUID

data class Membership(val costumer: Customer){
    val id: UUID = UUID.randomUUID()
    var active: Boolean = false
        private set
    fun activate() {
        active = true
    }
}