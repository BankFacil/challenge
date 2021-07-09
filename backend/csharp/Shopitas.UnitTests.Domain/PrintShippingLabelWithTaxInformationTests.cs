using NSubstitute;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Products;
using Shopitas.Domain.Services;
using Xunit;

namespace Shopitas.UnitTests.Domain
{
    public class PrintShippingLabelWithTaxInformationTests
    {
        [Fact]
        public void Should_print_the_label_with_address_and_tax_information()
        {
            var address = new Address("79010-150");
            const string taxInformation = "lorem ipsum";
            var printer = Substitute.For<Printer>();

            new PrintShippingLabelWithTaxInformation(printer)
                .Handle(new BookSold(address, taxInformation));

            printer.Received(1).Print($"{address} - {taxInformation}");
        }
    }
}