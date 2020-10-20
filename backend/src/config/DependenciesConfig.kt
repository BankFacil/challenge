package config

import adapter.mail.MailSenderImp
import core.deliver.BookProductDeliveryImp
import core.deliver.DigitalProductDeliveryImp
import core.deliver.MembershipProductDeliveryImp
import core.deliver.PhysicalProductDeliveryImp
import ports.DeliveryInterface
import ports.MailSenderInterface

object DependenciesConfig {
    fun MailSender(): MailSenderInterface {
        return MailSenderImp()
    }

    fun PhysicalProductDelivery(): DeliveryInterface {
        return PhysicalProductDeliveryImp()
    }

    fun MembershipProductDelivery(): DeliveryInterface {
        return MembershipProductDeliveryImp()
    }

    fun BookProductDelivery(): DeliveryInterface {
        return BookProductDeliveryImp()
    }

    fun DigitalProductDelivery(): DeliveryInterface {
        return DigitalProductDeliveryImp()
    }
}