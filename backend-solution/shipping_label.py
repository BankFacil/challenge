from product import Product, ProductKind


class ShippingLabel():
    def __init__(self, product: Product):
        self.product = product
        self.should_be_put_on_shipping_box = \
            ProductKind.is_physic(self.product.kind)
        self.has_tax_exemption = (product.kind == ProductKind.book)
