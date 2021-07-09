using Shopitas.Domain.Products;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class BookTests
    {
        [Fact]
        public void Book_product_should_have_a_name()
        {
            const string name = "Harry Potter and the Sorcerer's Stone";

            var book = new Book(name);

            Assert.Equal(name, book.Name);
        }
    }
}