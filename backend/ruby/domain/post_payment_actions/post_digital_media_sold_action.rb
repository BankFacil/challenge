class PostDigitalMediaSoldAction
    def initialize(mail_sender)
        @mail_sender = mail_sender
    end

    def execute(item, order)
        voucher_value = 10
        item_purchased_message = "You purchased a digital media: '#{item.product.name}', you won a #{voucher_value}$ voucher"
        @mail_sender.send(order.customer.mail, item_purchased_message)
        order.customer.give_a_voucher_of(voucher_value)
    end
end