require 'spec_helper'

describe Membership do

  context 'Membership' do

    let(:order) { Order.new(customer, product: product) }
    let(:customer) { Customer.new('foolano', 'foolano@123.com') }
    let(:product) { Product.new('service', 'membership') }


    context 'Membership validations' do
      subject { Membership.new(order) }
      it 'should return a membership object' do
        expect(subject).to be_an_instance_of(Membership)
      end

      it 'should return member information' do
        expect(subject.member).to include(:name, :email, :address, :created_at, :product_aquired, :active)
      end

      it 'should return membership sent mail information' do
        expect(subject.membership_mail).to eq(subject.membership_mail)
      end
    end
  end
end
