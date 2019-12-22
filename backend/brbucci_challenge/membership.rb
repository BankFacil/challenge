require 'pry'
require './order'

class Membership
    attr_reader :member, :membership_mail

    def initialize(order)
      @member = {
                  name: order.customer.name,
                  email: order.customer.email,
                  address: order.address.zipcode[:zipcode],
                  created_at: order.closed_at,
                  product_aquired: order.items.first.product.name,
                  active: status(order.closed_at)
                }
      @membership_mail = membership_notification(@member) if @member[:active]
    end

    def status(created_at)
      days_elapsed = (Time.now.to_date - created_at.to_date).to_i
      !!(days_elapsed <= 30)
    end

    def membership_notification(member)
      "Hello #{member[:name]}, your membership is activated and you can access your #{member[:product_aquired]} through this 'link'." #email shoud be sent/triggered from this method
    end
end
