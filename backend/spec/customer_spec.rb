require 'rspec'
require 'require_all'
require_all 'lib'

RSpec.describe Customer, "#customer" do
  context "data structure" do
    it "name and email" do
      customer = Customer.new(name: 'Beltrano', email: 'beltrano.silva@creditas.com.br')
      expect(customer.name).to eq 'Beltrano'
      expect(customer.email).to eq 'beltrano.silva@creditas.com.br'
    end

    it "credits" do
      customer = Customer.new(name: 'Beltrano', email: 'beltrano.silva@creditas.com.br')
      customer.add_credit(10)
      customer.add_credit(5)

      expect(customer.credits).to eq 15
    end

    it "memberships" do
      customer = Customer.new(name: 'Beltrano', email: 'beltrano.silva@creditas.com.br')
      membership = Membership.new(name: 'Monthly beer', price: 156.89)
      customer.add_membership(membership)

      expect(customer.memberships.first.class).to eq Membership
      expect(customer.memberships.first.status).to eq false
      membership.enable
      expect(customer.memberships.first.status).to eq true
    end

    it "disable membership" do
      membership = Membership.new(name: 'Netflix 4 computer plan', price: 36.89)
      expect(membership.status).to eq false
      membership.enable
      expect(membership.status).to eq true
      membership.disable
      expect(membership.status).to eq false
    end

  end
end

