namespace Shopitas.Domain.Base
{
    public abstract class Entity
    {
        public int Id { get; set; }

        public override bool Equals(object anotherObject)
        {
            var anotherEntity = anotherObject as Entity;
            if (anotherEntity == null)
                return base.Equals(anotherEntity);

            return Id == anotherEntity.Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }
    }
}