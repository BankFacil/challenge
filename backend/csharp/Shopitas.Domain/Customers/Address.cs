using Shopitas.Domain.Base;

namespace Shopitas.Domain.Customers
{
    public class Address : ValueObject
    {
        public Address(string zipcode)
        {
            Zipcode = zipcode;
        }

        public string Zipcode { get; }

        protected override string EqualityExpressionText => $"{Zipcode}";

        public override string ToString()
        {
            return $"Zipcode: {Zipcode}";
        }
    }
}