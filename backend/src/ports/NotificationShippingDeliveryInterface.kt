package ports

import core.deliver.Notification

interface NotificationShippingDeliveryInterface {
    fun generateNotification(message: String): Notification
}