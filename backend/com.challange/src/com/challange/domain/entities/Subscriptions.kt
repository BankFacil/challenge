package com.challange.domain.entities

import com.challange.domain.interfaces.ISubscription

class Subscriptions : ISubscription {
    var isActivated: Boolean = false

    override fun activateSubscription() {
        this.isActivated = true
    }
}