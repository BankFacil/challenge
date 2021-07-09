using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;

namespace Shopitas.Domain.Products
{
    public class DigitalMediaSold : DomainEvent
    {
        public DigitalMediaSold(Customer customer, Product product)
        {
            Customer = customer;
            Product = product;
        }

        public Customer Customer { get; set; }
        public Product Product { get; set; }
    }
}