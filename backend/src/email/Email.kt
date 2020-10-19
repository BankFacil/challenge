package email

class Email(private val message : String){
    fun sendMail():Boolean{
        val setMessage = message
        println("Email Enviado: $message")
        return true
    }
}