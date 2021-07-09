using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;

namespace Shopitas.Domain.Products
{
    public class PhysicalItemSold : DomainEvent
    {
        public PhysicalItemSold(Address address)
        {
            Address = address;
        }

        public Address Address { get; }
    }
}