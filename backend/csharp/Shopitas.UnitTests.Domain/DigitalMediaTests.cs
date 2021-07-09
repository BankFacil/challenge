using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class DigitalMediaTests
    {
        [Fact]
        public void Digital_media_product_should_have_a_name()
        {
            const string name = "aBook.epub";

            var digitalMedia = new DigitalMedia(name);

            Assert.Equal(name, digitalMedia.Name);
        }
    }
}