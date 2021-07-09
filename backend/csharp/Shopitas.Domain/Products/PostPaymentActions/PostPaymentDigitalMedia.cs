using Shopitas.Domain.Base;
using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Products.PostPaymentActions
{
    public class PostPaymentDigitalMedia : PostPaymentAction
    {
        public override void Do(Product product, Order order)
        {
            const decimal promotionalVoucherValue = 10;
            order.Customer.GiveAVoucherOf(promotionalVoucherValue);

            var digitalMediaSold = new DigitalMediaSold(order.Customer, product);
            DomainEventNotifier.CurrentNotifier.NotifyAbout(digitalMediaSold);
        }
    }
}