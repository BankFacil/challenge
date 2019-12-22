require 'spec_helper'

describe Address do

  context 'Address' do

    let(:zipcode) { '45678-979' }

    context 'valid instance of address' do
      subject { Address.new(:zipcode) }
      it 'should return a address object' do
        expect(subject).to be_an_instance_of(Address)
      end
    end
  end
end
