package order

//In real-life this container must be thread-safe
class OrderPaymentEventContainer {

    companion object {
        var events = mutableListOf<OrderPaymentEvent>()
            private set
        var hasEvents: Boolean = false
            private set

        fun addEvent(orderPaymentEvent: OrderPaymentEvent) {
            if(eventIsNotOnList(orderPaymentEvent)) {
                events.add(orderPaymentEvent)
                hasEvents = true
            }
        }

        fun handleEvents() {
            if(hasEvents) {
                events.forEach {
                    it.handle()
                }
                clearContainer()
            }
        }

        private fun eventIsNotOnList(orderPaymentEvent: OrderPaymentEvent): Boolean {
            return !events.any {
                it.eventType == orderPaymentEvent.eventType && it.order.id == orderPaymentEvent.order.id
            }
        }

        private fun clearContainer() {
            events = mutableListOf()
            hasEvents = false
        }
    }
}