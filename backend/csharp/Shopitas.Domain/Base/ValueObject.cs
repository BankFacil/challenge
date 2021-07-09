namespace Shopitas.Domain.Base
{
    public abstract class ValueObject
    {
        protected abstract string EqualityExpressionText { get; }

        public override bool Equals(object anotherObject)
        {
            var anotherValueObject = anotherObject as ValueObject;
            if (anotherValueObject == null)
                return base.Equals(anotherValueObject);

            return EqualityExpressionText == anotherValueObject.EqualityExpressionText;
        }

        public override int GetHashCode()
        {
            return EqualityExpressionText.GetHashCode();
        }

        public override string ToString()
        {
            return EqualityExpressionText;
        }
    }
}