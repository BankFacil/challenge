require 'bootstrap'

describe Voucher do
  it 'verificar se pode ser usando em pedido de valor maior' do
    voucher = Voucher.new(2)

    order = Order.new(Customer.new('paulo'))
    order.add_product(Products::Book.new('Awesome book'))
    
    expect(voucher.can_use?(order)).to eq(true)
  end

  it 'verificar se pode ser usando em pedido de valor menor' do
    voucher = Voucher.new(20)

    order = Order.new(Customer.new('paulo'))
    order.add_product(Products::Book.new('Awesome book'))
    
    expect(voucher.can_use?(order)).to eq(false)
  end

  it 'voucher com valor zero' do
    expect(Voucher.zero.value).to eq(0)
  end
end