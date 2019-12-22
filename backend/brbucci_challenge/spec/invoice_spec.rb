require 'spec_helper'

describe Invoice do

  context 'Invoice' do

    let(:attributes) { { billing_address: 'foo st., 138', shipping_address: 'foo st., 138', order: order } }
    let(:order) { Order.new(customer) }
    let(:customer) { Customer.new('foolano', 'foolano@123.com') }


    context 'valid instance of invoice' do
      subject { Invoice.new(attributes) }
      it 'should return an invoice object' do
        expect(subject).to be_an_instance_of(Invoice)
      end
    end
  end
end
