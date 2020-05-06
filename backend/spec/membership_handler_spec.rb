require 'bootstrap'

describe MembershipHandler do
  let(:memberships) { MembershipHandler.new }

  it 'adicionar itens' do
    memberships.add(Membership.new(Products::Product.new('Netflix')))
    expect(memberships.count).to eq(1)
  end

  it 'remover itens' do
    memberships.add(Membership.new(Products::Product.new('Netflix')))
    expect(memberships.count).to eq(1)
    memberships.remove('Netflix')
    expect(memberships.count).to eq(0)
    memberships.remove('algum item')
    expect(memberships.count).to eq(0)
  end

  it 'verificar se tem assinatura de um serviço específico' do
    memberships.add(Membership.new(Products::Product.new('Netflix')))
    memberships.activate('Netflix', 1)
    expect(memberships).to have_active_membership('Netflix')
    memberships.remove('Netflix')
    expect(memberships).not_to have_active_membership('Netflix')
  end
end