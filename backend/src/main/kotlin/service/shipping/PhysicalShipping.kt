package challenge.model

import challenge.Product
import challenge.Shipping
import challenge.model.type.LabelType
import challenge.service.shipping.ShippingLabel

class PhysicalShipping: Shipping {

    override fun ship(product: Product) {
        print("\n\nShipping for Physical item ${product.name}")
        ShippingLabel().generate(LabelType.PHYSICAL)
    }


}