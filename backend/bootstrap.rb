class Payment
  attr_reader :authorization_number, :invoice, :order, :payment_method, :paid_at, :result

  def initialize(attributes = {})
    @authorization_number, @amount = attributes.values_at(:authorization_number, :amount)
    @invoice, @order = attributes.values_at(:invoice, :order)
    @payment_method = attributes.values_at(:payment_method)
  end

  def pay(paid_at = Time.now)
    
    @discount = 0
    @paid_at = paid_at
    @result = Result.new(@order)

    result_for_physical
    result_for_membership
    result_for_ordinarybook
    result_for_media
   
    calculate_final_price
    @invoice = Invoice.new(billing_address: order.address, shipping_address: order.address, order: order)


    order.close(@paid_at)
  end

  def paid?
    !paid_at.nil?
  end

  def final_price
    @final_price
  end

  private

  def amount 
    @amount = order.total_amount
  end

  def calculate_final_price
    @final_price =  amount - @discount
  end

  def type_physical?
    order.items.first.product.type == :physical
  end
  def result_for_physical
    if type_physical?
      @result.generate_for_shipping
    end
  end
  def type_membership?
    order.items.first.product.type == :membership
  end
  def result_for_membership
    if type_membership?
      @result.generate_for_membership
    end
  end
  def type_ordinarybook?
    order.items.first.product.type == :ordinarybook
  end
  def result_for_ordinarybook
    if type_ordinarybook?
      @result.generate_for_ordinarybook
    end
  end
  def type_media?
    order.items.first.product.type == :media
  end
  def result_for_media
    if type_media?
      @discount = 10
      @result.generate_for_media
    end
  end
end

class Result
  def initialize(order)
    
    @order = order
    @customer = order.customer
    @membership = Membership.new(@customer)

  end
  def generate_for_shipping
    @label = true
  end
  def shipping_label?
    @label
  end

  def membership
    @membership
  end
  def generate_for_membership
    @membership.subscribe_and_notification
  end
  def show_notification
    'item as provided in the Constitution Art. 150, VI, d'
  end
  def notification?
    @notification
  end
  def generate_for_ordinarybook
    @notification = true
    @label = true
  end
  def generate_for_media
    purchase_send
  end
  def purchase_sended?
    @purchase_send
  end
  def purchase_send
    @purchase_send = true
    Purchase.new.send
  end
end

class Purchase
  def send
    :description
  end
end

class Membership

  def initialize(customer=nil)
    @customer = customer
  end

  def email
    @customer.email
  end

  def subscribe_and_notification
    @subscription = true
    @subscription_email = true
  end
  def subscription?
    @subscription
  end
  def subscription_email?
    @subscription_email
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

class Order
  attr_reader :customer, :items, :payment, :address, :closed_at

  def initialize(customer, overrides = {})
    @customer = customer
    @items = []
    @order_item_class = overrides.fetch(:item_class) { OrderItem }
    @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
  end

  def add_product(product)
    @items << @order_item_class.new(order: self, product: product)
  end

  def total_amount
    @items.map(&:total).inject(:+)
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end

  # remember: you can create new methods inside those classes to help you create a better design
end

class OrderItem
  attr_reader :order, :product

  def initialize(order:, product:)
    @order = order
    @product = product
  end

  def total
    10
  end
end

class Product
  # use type to distinguish each kind of product: physical, book, digital, membership, etc.
  attr_reader :name, :type

  def initialize(name:, type:)
    @name, @type = name, type
  end
end

class Address
  attr_reader :zipcode

  def initialize(zipcode:)
    @zipcode = zipcode
  end
end

class CreditCard
  def self.fetch_by_hashed(code)
    CreditCard.new
  end
end

class Customer
  def email
    :email
  end
end



# Book Example (build new payments if you need to properly test it)
foolano = Customer.new
book_order = Order.new(foolano)

book = Product.new(name: 'Awesome book', type: :book)
book_order.add_product(book)

payment_book = Payment.new(order: book_order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367'))
payment_book.pay
p payment_book.paid? # < true
p payment_book.order.items.first.product.type

# now, how to deal with shipping rules then?