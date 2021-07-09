using Shopitas.Domain.Base;
using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Products.PostPaymentActions
{
    public class PostPaymentBook : PostPaymentAction
    {
        public override void Do(Product product, Order order)
        {
            const string taxInformation = "Item isento de impostos conforme disposto na Constituição Art. 150, VI, d.";
            var shippingAddress = order.Payment.Invoice.ShippingAddress;
            order.ShippingLabel = new ShippingLabel(taxInformation, shippingAddress);
            DomainEventNotifier.CurrentNotifier.NotifyAbout(new BookSold(shippingAddress, taxInformation));
        }
    }
}