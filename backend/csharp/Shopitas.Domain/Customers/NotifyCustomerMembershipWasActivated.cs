using Shopitas.Domain.Base;
using Shopitas.Domain.Services;

namespace Shopitas.Domain.Customers
{
    public class NotifyCustomerMembershipWasActivated : DomainEventHandler<MembershipActivated>
    {
        private readonly MailSender _mailSender;

        public NotifyCustomerMembershipWasActivated(MailSender mailSender)
        {
            _mailSender = mailSender;
        }

        public void Handle(MembershipActivated domainEvent)
        {
            const string message = "Your membership was activated, congratulations";
            _mailSender.Send(domainEvent.Customer.Mail, message);
        }
    }
}