using System;
using System.Collections.Generic;
using Shopitas.Domain.Base;
using Shopitas.Domain.Customers;
using Shopitas.Domain.Products;

namespace Shopitas.Infrastructure
{
    public class FakeDomainEventNotifier : DomainEventNotifier
    {
        private readonly Dictionary<Type, object> _eventToHandlers = new Dictionary<Type, object>();

        public FakeDomainEventNotifier()
        {
            var fakeMailSender = new FakeMailSender();
            var fakePrinter = new FakePrinter();
            var notifyCustomerMembershipWasActivated = new NotifyCustomerMembershipWasActivated(fakeMailSender);
            var printShippingLabel = new PrintShippingLabel(fakePrinter);
            var printShippingLabelWithTaxInformation = new PrintShippingLabelWithTaxInformation(fakePrinter);
            var notifyDigitalMediaWasPurchased = new NotifyDigitalMediaWasPurchased(fakeMailSender);

            _eventToHandlers.Add(typeof(MembershipActivated), notifyCustomerMembershipWasActivated);
            _eventToHandlers.Add(typeof(PhysicalItemSold), printShippingLabel);
            _eventToHandlers.Add(typeof(BookSold), printShippingLabelWithTaxInformation);
            _eventToHandlers.Add(typeof(DigitalMediaSold), notifyDigitalMediaWasPurchased);
        }

        public override void NotifyAbout<T>(T domainEvent)
        {
            var eventToHandler = (DomainEventHandler<T>) _eventToHandlers[domainEvent.GetType()];
            eventToHandler.Handle(domainEvent);
        }
    }
}