from unittest import TestCase, main
from tests.helpers.products \
    import physic_product, digital_product, book_product
from shipping_label import ShippingLabel


class TestShippingLabel(TestCase):
    def test_should_can_create_a_shipping_label(self):
        shipping_label = ShippingLabel(
            product=physic_product
        )

        assert shipping_label.product == physic_product, \
            'Should set the product as the physic_product'

    def test_when_product_should_be_put_on_shipping_box(self):
        shipping_label = ShippingLabel(
            product=physic_product
        )

        assert shipping_label.should_be_put_on_shipping_box is True, \
            'Physics products should be put on shipping box'

    def test_when_product_should_not_be_put_on_shipping_box(self):
        shipping_label = ShippingLabel(
            product=digital_product
        )

        assert shipping_label.should_be_put_on_shipping_box is False, \
            'Digitals products should not be put on shipping box'

    def test_when_product_has_tax_exemption(self):
        shipping_label = ShippingLabel(
            product=book_product
        )

        assert shipping_label.has_tax_exemption is True, \
            'Book has tax exemption'

    def test_when_product_has_not_tax_exemption(self):
        shipping_label = ShippingLabel(
            product=digital_product
        )

        assert shipping_label.has_tax_exemption is False, \
            'Digital product has not tax exemption'


if __name__ == '__main__':
    main()
