using Shopitas.Domain.Base;
using Shopitas.Domain.Services;

namespace Shopitas.Domain.Products
{
    public class PrintShippingLabelWithTaxInformation : DomainEventHandler<BookSold>
    {
        private readonly Printer _printer;

        public PrintShippingLabelWithTaxInformation(Printer printer)
        {
            _printer = printer;
        }

        public void Handle(BookSold domainEvent)
        {
            _printer.Print($"{domainEvent.Address} - {domainEvent.TaxInformation}");
        }
    }
}