using NSubstitute;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Services;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class NotifyCustomerMembershipWasActivatedTests
    {
        [Fact]
        public void Should_notify_customer_in_his_mail()
        {
            const string expectedMessage = "Your membership was activated, congratulations";
            var customer = new Customer("gimoteco@gmail.com");
            var mailSender = Substitute.For<MailSender>();
            var domainEvent = new MembershipActivated(customer);

            new NotifyCustomerMembershipWasActivated(mailSender).Handle(domainEvent);

            mailSender.Received(1).Send(customer.Mail, expectedMessage);
        }
    }
}