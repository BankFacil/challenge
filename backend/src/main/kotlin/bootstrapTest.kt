package challenge

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class OrderTest {
    @Test
    fun mainReturnsCorrectSum() {
        val order = generateSampleOrder()
        order.preProcess()
        assertEquals(239.9, order.totalAmount, "O calculo do pedido funcionou corretamente")
    }
}