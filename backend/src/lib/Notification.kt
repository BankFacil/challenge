package challenge

interface Notification
class SimpleNotification(val body : String) : Notification

interface NotificatorInterface {
    fun send(notification : Notification)
}
class EmailNotificator(val email : String) : NotificatorInterface {
    override fun send(notification: Notification) {}
}