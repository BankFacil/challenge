require 'spec_helper'

describe Product do

  context 'Products' do

    let(:products) { [
                        { name: 'fail', type: 'none' },
                        { name: 'BDD', type: 'book' },
                        { name: 'music_videos', type: 'digital' },
                        { name: 'physical_item', type: 'physical' },
                        { name: 'service', type: 'membership' }
                      ]
                    }

    context 'valid instance of product' do
      subject { Product.new(products[1][:name], products[1][:type]) }
      it 'should return a product object' do
        expect(subject).to be_an_instance_of(Product)
      end
    end

    context 'type membership' do
      subject { Product.new(products[0][:name], products[0][:type]) }
      it 'product should be nil' do
        expect(subject.type).to be nil
      end
    end

    context 'type book' do
      subject { Product.new(products[1][:name], products[1][:type]) }
      it 'product should be a book' do
        expect(subject.type).to eq('book')
      end
    end

    context 'type digital' do
      subject { Product.new(products[2][:name], products[2][:type]) }
      it 'product should be a digital content' do
        expect(subject.type).to eq('digital')
      end
    end

    context 'type item' do
      subject { Product.new(products[3][:name], products[3][:type]) }
      it 'product should be a physical item' do
        expect(subject.type).to eq('physical')
      end
    end

    context 'type membership' do
      subject { Product.new(products[4][:name], products[4][:type]) }
      it 'product should be a membership service' do
        expect(subject.type).to eq('membership')
      end
    end
  end
end
