using Shopitas.Domain.Base;

namespace Shopitas.Domain.Customers
{
    public class MembershipActivated : DomainEvent
    {
        public MembershipActivated(Customer customer)
        {
            Customer = customer;
        }

        public Customer Customer { get; }
    }
}