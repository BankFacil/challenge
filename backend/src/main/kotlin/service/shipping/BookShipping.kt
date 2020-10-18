package challenge

import challenge.model.type.LabelType
import challenge.service.shipping.ShippingLabel

class BookShipping() : Shipping {

    override fun ship(product: Product) {
        print("\n\nShipping for Book item ${product.name}")
        ShippingLabel().generate(LabelType.TAX_FREE)
    }


}