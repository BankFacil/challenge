require_relative './address'
require_relative './order_item'
require_relative './payment'

class Order
  attr_accessor :id
  attr_reader :customer, :items, :payment, :address, :closed_at, :shipping_label
  
  def initialize(customer)
    @id = 0
    @customer = customer
    @items = []
    @address = Address.new(zipcode: '45678-979')
  end
  
  def add_product(product)
    @items << OrderItem.new(order: self, product: product)
  end
  
  def total_amount
    @items.map(&:total).inject(:+)
  end
  
  def close(closed_at = Time.now)
    @closed_at = closed_at
  end
  
  def is_closed?
    !@closed_at.nil?
  end
  
  def pay(payment_method)
    raise 'No items ordered' unless @items.any?
    register_payment payment_method
    close
  end
  
  def register_payment(payment_method)
    @payment = Payment.new payment_method, Time.now, self
  end
  
  def is_paid?
    !payment.nil?
  end
  
  def shipping_address
    @payment.invoice.shipping_address
  end

  def ship_to(shipping_label)
    @shipping_label = shipping_label
  end
end