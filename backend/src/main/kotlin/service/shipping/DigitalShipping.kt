package challenge

import service.shipping.notification.EmailNotification

class DigitalShipping(val customer : Customer): Shipping {

    override fun ship(product: Product) {
        print("\n\nShipping for Digital item ${product.name}")
        print("Send email for customer ${customer.email}")
        EmailNotification().sendEmail(customer, "Product ${product.name} - ${product.price}")
        customer.addVoucher(10.00)
    }

}