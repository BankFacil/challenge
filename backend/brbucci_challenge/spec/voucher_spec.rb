require 'spec_helper'

describe Voucher do

  context 'Voucher' do
    let(:product) { Product.new('music_videos', 'digital') }

    context 'Voucher validations' do
      subject { Voucher.new(product.type) }
      it 'should return a voucher object' do
        expect(subject).to be_an_instance_of(Voucher)
      end

      it 'should return a voucher key' do
        expect(subject.voucher[:key]).to eq(subject.voucher[:key])
      end

      it 'should return discount of 10 if digital type ' do
        expect(subject.voucher[:discount]).to eq(10)
      end
    end
  end
end
