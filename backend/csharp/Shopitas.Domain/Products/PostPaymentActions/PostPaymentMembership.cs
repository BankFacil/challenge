using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Products.PostPaymentActions
{
    public class PostPaymentMembership : PostPaymentAction
    {
        public override void Do(Product product, Order order)
        {
            var customer = order.Customer;
            customer.ActivateMembership(product as Membership);
        }
    }
}