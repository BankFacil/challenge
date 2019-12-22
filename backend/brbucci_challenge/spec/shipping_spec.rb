require 'spec_helper'

describe Shipping do

  context 'Shipping' do

    let(:order) { Order.new(customer, product: product) }
    let(:customer) { Customer.new('foolano', 'foolano@123.com') }
    let(:product) { Product.new('service', 'membership') }
    let(:membership) { Membership.new(order) }

    context 'Shipping validations' do
      subject { Shipping.new(order, options: membership) }
      it 'should return a shipping object' do
        expect(subject).to be_an_instance_of(Shipping)
      end
    end
  end
end
