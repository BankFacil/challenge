using System;

namespace Shopitas.Domain.Base
{
    public abstract class DomainEventNotifier
    {
        private static DomainEventNotifier _currentNotifier;

        public static DomainEventNotifier CurrentNotifier
        {
            get => _currentNotifier;
            set => _currentNotifier = value ?? throw new ArgumentNullException(nameof(value));
        }

        public abstract void NotifyAbout<T>(T domainEvent) where T : DomainEvent;
    }
}