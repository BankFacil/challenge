from unittest import TestCase, main
from product import Product, ProductKind


class TestProduct(TestCase):
    def test_should_can_create_a_product(self):
        product = Product(
            name='something',
            kind=ProductKind.physic,
            price=100
        )

        assert product.name == 'something', \
            'Should set the same as "something"'
        assert product.kind == ProductKind.physic, \
            'Should set the product type as "physic"'
        assert product.price == 100, 'Should set the price as 100'

    def test_check_physic_products(self):
        assert ProductKind.is_physic(ProductKind.physic) is True, \
            'A physic product is physic'
        assert ProductKind.is_physic(ProductKind.book) is True, \
            'A book product is physic'
        assert ProductKind.is_physic(ProductKind.digital) is False, \
            'A digital product is not physic'


if __name__ == '__main__':
    main()
