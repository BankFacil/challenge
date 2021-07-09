namespace Shopitas.Domain.Base
{
    public interface DomainEventHandler<in T> where T : DomainEvent
    {
        void Handle(T domainEvent);
    }
}