package core.order

import core.treatments.ShippingLabelTreatment
import core.treatments.ShippingLabelFreeTaxTreatment
import core.treatments.DigitalTreatment
import core.treatments.MembershipTreatment
import core.treatments.Treatment

enum class ProductType(val treatment: Treatment) {
    PHYSICAL(ShippingLabelTreatment.treatment()),
    BOOK(ShippingLabelFreeTaxTreatment.treatment()),
    DIGITAL(DigitalTreatment.treatment()),
    MEMBERSHIP(MembershipTreatment.treatment())
}