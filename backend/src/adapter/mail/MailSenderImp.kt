package adapter.mail

import core.deliver.Mail
import ports.MailSenderInterface

class MailSenderImp(): MailSenderInterface {
    override fun send(mail: Mail) {
        println("sending mail to: ${mail.customer.mail} - title: ${mail.title} - body: ${mail.body}")
    }
}