namespace Shopitas.Domain.Products
{
    public class Book : Product
    {
        public Book(string name) : base(name, ProductType.Book)
        {
        }
    }
}