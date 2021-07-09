using Shopitas.Domain.Base;
using Shopitas.Domain.Services;

namespace Shopitas.Domain.Products
{
    public class PrintShippingLabel : DomainEventHandler<PhysicalItemSold>
    {
        private readonly Printer _printer;

        public PrintShippingLabel(Printer printer)
        {
            _printer = printer;
        }

        public void Handle(PhysicalItemSold domainEvent)
        {
            _printer.Print(domainEvent.Address.ToString());
        }
    }
}