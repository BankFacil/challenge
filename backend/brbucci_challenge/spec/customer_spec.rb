require 'spec_helper'

describe Customer do

  context 'Customer' do

    let(:customer) { { name: 'foolano', email: 'foolano@123.com' } }

    context 'valid instance of customer' do
      subject { Customer.new(customer[:name], customer[:email]) }
      it 'should return a customer object' do
        expect(subject).to be_an_instance_of(Customer)
      end

      it 'should return email' do
        expect(subject.email).to eq('foolano@123.com')
      end
    end
  end
end
