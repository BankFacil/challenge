package ports

import core.deliver.Mail

interface MailSenderInterface {
    fun send(mail: Mail)
}