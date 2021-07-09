namespace Shopitas.Domain.Products
{
    public class PhysicalItem : Product
    {
        public PhysicalItem(string name) : base(name, ProductType.PhysicalItem)
        {
        }
    }
}