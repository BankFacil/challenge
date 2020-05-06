require 'date'

require './lib/products/product'
require './lib/products/physical'
require './lib/products/digital'
require './lib/products/book'
require './lib/products/membership'

class MailService
  def self.send_details(product)
  end
end

class Customer
  attr_reader :name, :memberships

  def initialize(name)
    @name = name
    @memberships = MembershipHandler.new
  end
end

class MembershipHandler
  def initialize
    @memberships = []
  end

  def add(membership)
    @memberships << membership
  end

  def remove(name)
    @memberships.select! { |membership| membership.name != name }
  end

  def activate(name, period)
    @memberships
      .select { |membership| membership.name == name }[0]
      .activate(period)
  end

  def has_active_membership?(name)
    @memberships.any? do |membership|
      membership.name == name && membership.active?
    end
  end

  def count
    @memberships.size
  end
end

class Voucher
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def can_use?(order)
    order.total_amount - @value >= 0
  end

  def self.zero
    @@voucher ||= Voucher.new(0)
  end
end

class Address
  attr_reader :zipcode

  def initialize(zipcode:)
    @zipcode = zipcode
  end
end

class Order
  attr_reader :items, :address, :customer

  def initialize(customer, overrides = {})
    @customer = customer
    @items = []
    @order_item_class = overrides.fetch(:item_class) { OrderItem }
    @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
  end

  def add_product(product)
    @items << @order_item_class.new(order: self, product: product)
  end

  def remove_product(name)
    @items.select! { |item| item.product.name != name }
  end

  def total_amount
    @items.map(&:total).inject(:+) || 0
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end
end

class OrderItem
  attr_reader :order, :product

  def initialize(order:, product:)
    @order, @product = order, product
  end

  def total
    10
  end
end

class Membership
  attr_reader :expires_at, :name

  def initialize(product)
    @name = product.name
    @expires_at = nil
  end

  def activate(period = 1)
    @expires_at = DateTime.now + period * 30
  end

  def active?
    @expires_at ? DateTime.now <= @expires_at : false
  end
end

class CreditCard
  def self.fetch_by_hashed(code)
    CreditCard.new
  end
end

class Invoice
  attr_reader :billing_address, :shipping_address, :order

  def initialize(attributes = {})
    @billing_address = attributes.values_at(:billing_address)
    @shipping_address = attributes.values_at(:shipping_address)
    @order = attributes.values_at(:order)
  end
end

class Payment
  attr_reader :authorization_number, :amount, :invoice, :order, :payment_method, :paid_at

  def initialize(attributes = {})
    @authorization_number = attributes.values_at(:authorization_number)
    @amount = attributes[:amount] || 0
    @invoice, @order = attributes.values_at(:invoice, :order)
    @payment_method = attributes.values_at(:payment_method)
  end

  def pay(voucher: Voucher.zero, paid_at: Time.now)
    raise Exception.new unless @order.items.size > 0

    @authorization_number = Time.now.to_i
    @invoice = Invoice.new(billing_address: @order.address, shipping_address: @order.address, order: @order)
    @paid_at = paid_at
    @order.close(@paid_at)

    @amount = @order.total_amount - voucher.value
    @amount > 0 ? Voucher.zero : Voucher.new(@amount.abs)
  end

  def paid?
    !paid_at.nil?
  end
end

class ShippingLabel
  attr_reader :customer, :item, :shipping_carton

  def initialize(customer, item)
    @customer = customer
    @item = item
    @shipping_carton = true
  end

  def tax_exempt?
    @item.product.tax_exempt
  end

  def self.create_from(payment, label = ShippingLabel)
    payment.order.items
      .map { |item| label.new(payment.order, item) }
      .each { |label| label.item.product.prepare_delivery }
  end
end

foolano = Customer.new('Paulo')
order = Order.new(foolano)
order.add_product(Products::Book.new('Awesome book'))
order.add_product(Products::Physical.new('Pochete do Shersterson'))

payment = Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
payment.pay

if payment.paid?
  ShippingLabel.create_from(payment).each do |label|
    puts "membership? #{payment.order.customer.memberships.has_active_membership?('Netflix')}"
    puts "tax exempt? #{label.tax_exempt?}"
  end
end