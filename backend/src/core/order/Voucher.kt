package core.order

import java.util.UUID

data class Voucher(val value: Double) {
    val code: UUID = UUID.randomUUID()
}