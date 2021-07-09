using Shopitas.Domain.Orders;

namespace Shopitas.Domain.Products.PostPaymentActions
{
    public abstract class PostPaymentAction
    {
        public abstract void Do(Product product, Order order);
    }
}