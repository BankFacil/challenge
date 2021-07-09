using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;

namespace Shopitas.Domain.Products
{
    public class BookSold : DomainEvent
    {
        public BookSold(Address address, string taxInformation)
        {
            Address = address;
            TaxInformation = taxInformation;
        }

        public Address Address { get; }
        public string TaxInformation { get; }
    }
}