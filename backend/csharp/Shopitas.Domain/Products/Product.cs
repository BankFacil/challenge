using Shopitas.Domain.Base;

namespace Shopitas.Domain.Products
{
    public class Product : Entity
    {
        protected Product(string name, ProductType type)
        {
            Name = name;
            Type = type;
        }

        public string Name { get; }
        public ProductType Type { get; }
    }
}