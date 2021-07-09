using Shopitas.Domain.Base;
using Shopitas.Domain.Services;

namespace Shopitas.Domain.Products
{
    public class NotifyDigitalMediaWasPurchased : DomainEventHandler<DigitalMediaSold>
    {
        private readonly MailSender _mailSender;

        public NotifyDigitalMediaWasPurchased(MailSender mailSender)
        {
            _mailSender = mailSender;
        }

        public void Handle(DigitalMediaSold domainEvent)
        {
            var customer = domainEvent.Customer;
            var message = $"You purchased a {domainEvent.Product.Name}";
            _mailSender.Send(customer.Mail, message);
        }
    }
}