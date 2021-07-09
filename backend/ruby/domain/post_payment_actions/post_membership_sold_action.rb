class PostMembershipSoldAction
    def initialize(mail_sender)
        @mail_sender = mail_sender
    end

    def execute(item, order)
        activation_message = "Congrats, your membership '#{item.product.name}' was activated"
        @mail_sender.send(order.customer.mail, activation_message)
        order.customer.add_a_membership(item.product)
    end
end