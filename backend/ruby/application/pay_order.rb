require_relative '../domain/credit_card'
require_relative '../domain/post_payment_actions/post_book_sold_action'
require_relative '../domain/post_payment_actions/post_physical_item_sold_action'
require_relative '../domain/post_payment_actions/post_membership_sold_action'
require_relative '../domain/post_payment_actions/post_digital_media_sold_action'

class PayOrder
    def initialize(mail_sender, printer, orders)
        @orders = orders
        @printer = printer
        @mail_sender = mail_sender
        @actions = {
            "book" => PostBookSoldAction.new(@printer), 
            "physical_item" => PostPhysicalItemSoldAction.new(@printer),
            "membership" => PostMembershipSoldAction.new(@mail_sender),
            "digital_media" => PostDigitalMediaSoldAction.new(@mail_sender),
        }
    end

    def pay(order_id, credit_card_hash)
        order = @orders.get_by(order_id)
        payment_method = CreditCard.fetch_by_hashed(credit_card_hash)

        order.pay payment_method

        execute_post_payment_actions order

        @orders.update(order);
    end

    def execute_post_payment_actions(order)
        order.items.each { |item|
            @actions[item.product.type].execute(item, order)
        }
    end
end

