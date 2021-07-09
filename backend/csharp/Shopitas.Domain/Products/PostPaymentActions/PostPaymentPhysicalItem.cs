using Shopitas.Domain.Base;
using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Products.PostPaymentActions
{
    public class PostPaymentPhysicalItem : PostPaymentAction
    {
        public override void Do(Product product, Order order)
        {
            var shippingAddress = order.Payment.Invoice.ShippingAddress;
            order.ShippingLabel = new ShippingLabel(shippingAddress);
            DomainEventNotifier.CurrentNotifier.NotifyAbout(new PhysicalItemSold(shippingAddress));
        }
    }
}