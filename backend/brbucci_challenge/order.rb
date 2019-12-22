require 'pry'
require './order_item'
require './membership'
require './payment'
require './credit_card'
require './shipping'

class Order
  attr_reader :customer, :items, :payment, :address, :closed_at, :number, :shipping

  def initialize(customer, overrides = {})
    @number = 5.times.map { rand(1..9) }.join.to_i
    @customer = customer
    @items = []
    @order_item_class = overrides.fetch(:item_class) { OrderItem }
    @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
    return nil unless overrides.any?
    add_product(overrides[:product])
    order_payment = Payment.new(order: self, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
    order_payment.pay
    membership = Membership.new(self) if order_payment.order.items.first.product.type.include?('membership')
    options = { member: membership.member } if membership
    process_shipping(options) if order_payment.paid?
  end

  def add_product(product)
    @items << @order_item_class.new(self, product)
  end

  def total_amount
    @items.map(&:total).inject(:+)
  end

  def process_shipping(options = {})
    @shipping = Shipping.new(self, options)
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end
end
