require 'bootstrap'

describe Order do
  let(:order) { Order.new(Customer.new('Paulo')) }

  it 'inicializar sem parâmetros' do
    expect { Order.new }.to raise_error(ArgumentError)
    expect(order.items).to be_empty
  end

  def add_items
    order.add_product(Products::Book.new('Senhor dos Anéis'))
    order.add_product(Products::Physical.new('Vassoura'))
    order.add_product(Products::Membership.new('Netflix', 1))
  end

  def remove_items
    order.remove_product('Vassoura')
    order.remove_product('Netflix')
  end

  it 'adicionar itens' do
    add_items
    expect(order.items.size).to eql(3)
    expect(order.items[1].product.name).to eql('Vassoura')
  end

  it 'remover itens' do
    add_items
    remove_items
    expect(order.items.size).to eql(1)
    expect(order.items[0].product.name).to eql('Senhor dos Anéis')
  end

  it 'remover item invalido' do
    order.remove_product('Goiaba')
    expect(order.items.size).to eql(0)
  end

  it 'valor total' do
    expect(order.total_amount).to eql(0)
    add_items
    expect(order.total_amount).to eql(30)
    remove_items
    expect(order.total_amount).to eql(10)
  end
end