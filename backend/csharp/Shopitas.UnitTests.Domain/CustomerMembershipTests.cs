using NSubstitute;
using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class CustomerMembershipTests
    {
        public CustomerMembershipTests()
        {
            DomainEventNotifier.CurrentNotifier = Substitute.For<DomainEventNotifier>();
            _customer = new Customer("gimoteco@gmail.com");
            _membership = new Membership("Premium membership");
        }

        private readonly Customer _customer;
        private readonly Membership _membership;

        [Fact]
        public void Membership_should_be_created_inactive()
        {
            var customerMembership = new CustomerMembership(_membership, _customer);

            Assert.False(customerMembership.Activated);
        }

        [Fact]
        public void Should_activate_a_membership()
        {
            var customerMembership = new CustomerMembership(_membership, _customer);

            customerMembership.Activate();

            Assert.True(customerMembership.Activated);
        }
    }
}