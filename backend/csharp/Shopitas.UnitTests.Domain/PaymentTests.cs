using System;
using System.Linq;
using Shopitas.Domain.Payments;
using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class PaymentTests
    {
        [Fact]
        public void Payment_should_generate_the_authorization_number_based_on_ticks_of_the_current_date()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.Equal(paymentDate.Ticks, payment.AuthorizationNumber);
        }

        [Fact]
        public void Payment_should_register_the_invoice()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.NotNull(payment.Invoice);
        }

        [Fact]
        public void Payment_should_register_the_payment_date()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.Equal(paymentDate, payment.PaidAt);
        }

        [Fact]
        public void Payment_should_register_the_total_based_on_the_sum_of_order_items()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();
            var membership = new Membership("Premium membership");
            order.AddProduct(membership);
            var expectedTotal = order.Items.Sum(item => item.Total);

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.Equal(expectedTotal, payment.Amount);
        }

        [Fact]
        public void Payment_should_use_the_billing_address_choosed_in_order()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.Equal(paymentDate, payment.PaidAt);
        }

        [Fact]
        public void Payment_should_use_the_shipping_address_choosed_in_order()
        {
            var paymentMethod = CreditCard.FetchByHashed("123");
            var paymentDate = DateTime.Now;
            var order = OrderBuilder.New().Create();

            var payment = new Payment(paymentMethod, paymentDate, order);

            Assert.Equal(paymentDate, payment.PaidAt);
        }
    }
}