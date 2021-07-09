using NSubstitute;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Products;
using Shopitas.Domain.Services;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class NotifyDigitalMediaWasPurchasedTests
    {
        [Fact]
        public void Should_send_a_mail_to_costumer_informing_the_digital_media_was_purchased()
        {
            var product = new DigitalMedia("Johnny B. Goode.mp3");
            var customer = new Customer("gimoteco@gmail.com");
            var expectedMailMessage = $"You purchased a {product.Name}";
            var mailSender = Substitute.For<MailSender>();

            new NotifyDigitalMediaWasPurchased(mailSender).Handle(new DigitalMediaSold(customer, product));

            mailSender.Received(1).Send(customer.Mail, expectedMailMessage);
        }
    }
}