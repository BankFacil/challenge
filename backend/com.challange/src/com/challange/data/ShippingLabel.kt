package com.challange.data

import com.challange.data.interfaces.IShippingLabel

class ShippingLabel : IShippingLabel {

    override fun generateShippingLabel(isARegularBook: Boolean) {
        //if its true, it will generate the shipping label according with the law
        if(isARegularBook) {
            //TODO
        } else {
            //TODO
        }
    }
}