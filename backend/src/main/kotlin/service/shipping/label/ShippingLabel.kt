package challenge.service.shipping

import challenge.model.type.LabelType

open class ShippingLabel() {

    fun generate(label: LabelType){
        print("\nShipping label [${label}]")
    }


}