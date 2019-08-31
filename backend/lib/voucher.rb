class Voucher
  attr_reader :valor,:order

  def initialize(order:)
    @order = order
    if(order.get_type == :digital)
      create()
    end

  end

  def create
    @valor = 'R$ 10,00'
  end
end