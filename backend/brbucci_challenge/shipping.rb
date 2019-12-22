require 'pry'
require './voucher'

class Shipping
    attr_reader :shipping_info

    DIGITAL_CONTENT = %w(membership digital)
    SHIPPING_LABEL = %w(book physical)

    def initialize(order, options = {})
      digital_content = digital_delivery(order) if DIGITAL_CONTENT.include?(order.items.first.product.type)
      physical_content = shipping_label(order.items.first.product.type) if SHIPPING_LABEL.include?(order.items.first.product.type)
      @shipping_info =  if digital_content.nil?
                          { shipping_label: physical_content[:notification] }
                        else
                          { email_sent: digital_content[:notification] }
                        end
    end

    def status(created_at)
      days_elapsed = (Time.now.to_date - created_at.to_date).to_i
      !!(days_elapsed <= 30)
    end

    def digital_delivery(order)
      customer_info = customer_info(order)
      discount_voucher = Voucher.new(order.items.first.product.type)
      notification = if order.items.first.product.type.include?('digital')
                       { notification: "Hello #{customer_info[:name]}, your order is completed and you can access the content of #{customer_info[:product]} through the following 'link'. You've still won R$#{discount_voucher.voucher[:discount]}, just need to apply this number: #{discount_voucher.voucher[:key]} in your next order" }
                     else
                       { notification: "Hello #{customer_info[:name]}, your order is completed and an e-mail announcing your your membership is active was already sent" }  #email here for both digital media and memebership (delivery description) the message is ilustrative
                     end
    end

    def shipping_label(order_type)
      notification = if order_type.include?('physical')
                       { notification: 'Put in shipping box'}
                     else
                       { notification: 'This item is tax free according to Federal Constitution Art. 150, VI, d.'}
                     end
    end

    def customer_info(order)
      { name: order.customer.name, email: order.customer.email, product: order.items.first.product.name }
    end
end
