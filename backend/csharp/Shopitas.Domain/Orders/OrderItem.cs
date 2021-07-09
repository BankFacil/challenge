using System;
using System.Collections.Generic;
using Shopitas.Domain.Base;
using Shopitas.Domain.Products;
using Shopitas.Domain.Products.PostPaymentActions;

namespace Shopitas.Domain.Orders
{
    public class OrderItem : Entity
    {
        public IDictionary<ProductType, Action<Product, Order>> PostPaymentActions =
            new Dictionary<ProductType, Action<Product, Order>>
            {
                {ProductType.Book, (product, order) => new PostPaymentBook().Do(product, order)},
                {ProductType.Membership, (product, order) => new PostPaymentMembership().Do(product, order)},
                {ProductType.DigitalMedia, (product, order) => new PostPaymentDigitalMedia().Do(product, order)},
                {ProductType.PhysicalItem, (product, order) => new PostPaymentPhysicalItem().Do(product, order)}
            };


        public OrderItem(Order order, Product product)
        {
            Order = order;
            Product = product;
        }

        public decimal Total => 10;
        public Order Order { get; }
        public Product Product { get; }

        public void ExecutePostPaymentAction()
        {
            PostPaymentActions[Product.Type](Product, Order);
        }
    }
}