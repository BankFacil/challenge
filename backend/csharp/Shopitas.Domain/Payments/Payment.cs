using System;
using Shopitas.Domain.Base;
using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Payments
{
    public class Payment: ValueObject
    {
        public Payment(PaymentMethod paymentMethod, DateTime paidAt, Order order)
        {
            PaymentMethod = paymentMethod;
            PaidAt = paidAt;
            AuthorizationNumber = paidAt.Ticks;
            Amount = order.TotalAmount;
            GenerateInvoice(order);
        }

        public long AuthorizationNumber { get; }
        public decimal Amount { get; }
        public Invoice Invoice { get; set; }
        public PaymentMethod PaymentMethod { get; }
        public DateTime PaidAt { get; }

        private void GenerateInvoice(Order order)
        {
            var billingAddress = order.Address;
            var shippingAddress = order.Address;
            Invoice = new Invoice(billingAddress, shippingAddress, order);
        }

        protected override string EqualityExpressionText =>
            $"{AuthorizationNumber},{Amount},{Invoice},{PaymentMethod},{PaidAt}";
    }
}