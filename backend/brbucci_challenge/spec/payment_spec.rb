require 'spec_helper'

describe Payment do

  context 'Payment' do

    let(:order) { Order.new(customer, product: product) }
    let(:customer) { Customer.new('foolano', 'foolano@123.com') }
    let(:product) { Product.new('service', 'membership') }

    context 'Payment validations' do
      subject { Payment.new(order: order, payment_method: CreditCard.fetch_by_hashed('43567890-987654367')) }
      it 'should return a payment object' do
        expect(subject).to be_an_instance_of(Payment)
      end

      it 'should pay the order' do
        expect(subject.pay).to eq(subject.paid_at)
        expect(subject.paid?).to be_truthy
      end

      it 'should return true for paid order' do
        expect(subject.pay).to eq(subject.paid_at)
        expect(subject.paid?).to be_truthy
      end

      it 'should return false for unpaid paid order' do
        expect(subject.paid?).to be false
      end
    end
  end
end
