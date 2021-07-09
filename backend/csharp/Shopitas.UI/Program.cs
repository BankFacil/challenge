using System;
using System.Linq;
using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Orders;
using Shopitas.Domain.Payments;
using Shopitas.Domain.Products;
using Shopitas.Infrastructure;

namespace Shopitas.UI
{
    public class Program
    {
        private static void Main(string[] args)
        {
            ConfigureApplication();

            var foolano = new Customer("gimoteco@gmail.com");
            var book = new Book("Awesome book");
            var broom = new PhysicalItem("Broom");
            var membership = new Membership("Premium account");
            var address = new Address("79042-656");
            var digitalMedia = new DigitalMedia("AwesomeBook.epub");
            var creditCard = CreditCard.FetchByHashed("43567890-987654367");

            var order = new Order(foolano, address);
            order.AddProduct(book);
            order.AddProduct(broom);
            order.AddProduct(membership);
            order.AddProduct(digitalMedia);
            order.Pay(creditCard);

            Console.WriteLine(order.IsPaid);
            Console.WriteLine(order.Items[0].Product);
            Console.WriteLine(foolano.Memberships.First().Activated);
        }

        private static void ConfigureApplication()
        {
            DomainEventNotifier.CurrentNotifier = new FakeDomainEventNotifier();
        }
    }
}