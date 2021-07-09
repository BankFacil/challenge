using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class MembershipTests
    {
        [Fact]
        public void Membership_product_should_have_a_name()
        {
            const string membershipName = "Premium membership";

            var membership = new Membership(membershipName);

            Assert.Equal(membershipName, membership.Name);
        }
    }
}