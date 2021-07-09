using System;
using System.Linq;
using NSubstitute;
using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Orders;
using Shopitas.Domain.Payments;
using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class OrderTests
    {
        public OrderTests()
        {
            _domainEventNotifier = Substitute.For<DomainEventNotifier>();
            DomainEventNotifier.CurrentNotifier = _domainEventNotifier;
            _digitalMedia = new DigitalMedia("despacito.mp3");
            _book = new Book("Sapiens");
            _customer = new Customer("gimoteco@gmail.com");
            _address = new Address("79042-656");
            _membership = new Membership("Premium service");
            _paymentMethod = CreditCard.FetchByHashed("123");
            _physicalItem = new PhysicalItem("broom");
        }

        private readonly Customer _customer;
        private readonly Address _address;
        private readonly Membership _membership;
        private readonly CreditCard _paymentMethod;
        private readonly Product _physicalItem;
        private readonly Book _book;
        private readonly Product _digitalMedia;
        private readonly DomainEventNotifier _domainEventNotifier;


        [Fact]
        public void A_book_sold_should_generate_the_shipping_label_with_tax_information()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_book);
            const string expectedTaxInfo = "Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.";

            order.Pay(_paymentMethod);

            Assert.Equal(order.ShippingLabel,
                new ShippingLabel(expectedTaxInfo, order.Payment.Invoice.ShippingAddress));
            _domainEventNotifier.Received(1)
                .NotifyAbout(Arg.Is<DomainEvent>(@event => @event is BookSold));
        }

        [Fact]
        public void A_digital_media_sold_should_give_a_10_usd_voucher()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_digitalMedia);
            const int expectVoucherValue = 10;

            order.Pay(_paymentMethod);

            var actualVoucher = _customer.Vouchers.First();
            Assert.Equal(_customer.Vouchers.Count, 1);
            Assert.Equal(actualVoucher.Value, expectVoucherValue);
        }

        [Fact]
        public void A_digital_media_sold_should_notify_the_customer()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_digitalMedia);

            order.Pay(_paymentMethod);

            _domainEventNotifier.Received(1)
                .NotifyAbout(Arg.Is<DomainEvent>(@event => @event is DigitalMediaSold));
        }

        [Fact]
        public void A_membership_order_payment_should_activate_the_membership()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_membership);

            order.Pay(_paymentMethod);

            var customerMembership =
                order.Customer.Memberships.First(customerMembership1 => customerMembership1.Membership == _membership);
            Assert.True(customerMembership.Activated);
        }

        [Fact]
        public void A_order_with_physical_items_should_generate_a_print_label()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_physicalItem);

            order.Pay(_paymentMethod);

            Assert.NotNull(order.ShippingLabel);
            Assert.Equal(order.Payment.Invoice.ShippingAddress, order.ShippingLabel.Address);
        }

        [Fact]
        public void A_paid_order_should_register_payment_data()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_membership);

            order.Pay(_paymentMethod);

            Assert.NotNull(order.Payment);
        }

        [Fact]
        public void Should_close_an_order_after_payment()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_membership);

            order.Pay(_paymentMethod);

            DateTimeAssert.Equal(DateTime.Now, order.ClosedAt.Value, TimeSpan.FromSeconds(1));
        }

        [Fact]
        public void Should_pay_an_order_and_register_the_date()
        {
            var order = new Order(_customer, _address);
            order.AddProduct(_membership);

            order.Pay(_paymentMethod);

            Assert.True(order.IsPaid);
            DateTimeAssert.Equal(DateTime.Now, order.Payment.PaidAt, TimeSpan.FromSeconds(1));
        }
    }
}