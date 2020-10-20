package core.deliver

import core.customer.Customer

data class Mail(val customer: Customer, val title: String, val body: String)