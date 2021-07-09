using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class PhysicalItemTests
    {
        [Fact]
        public void Customer_should_require_a_mail()
        {
            const string name = "broom";

            var physicalItem = new PhysicalItem(name);

            Assert.Equal(name, physicalItem.Name);
        }
    }
}