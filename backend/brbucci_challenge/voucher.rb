require 'pry'

class Voucher

  attr_reader :voucher

  def initialize(order_type)
    @voucher = voucher_generator if order_type.include?('digital')
  end

  def voucher_generator
    { key: 7.times.map { rand(1..9) }.join.to_i, discount: 10 }
  end
end
