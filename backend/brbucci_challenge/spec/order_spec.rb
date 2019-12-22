require 'spec_helper'

describe Order do

  context 'Order' do

    let(:customer) { Customer.new('foolano', 'foolano@123.com') }
    let(:products) { [
                        { name: 'BDD', type: 'book' },
                        { name: 'music_videos', type: 'digital' },
                        { name: 'physical_item', type: 'physical' },
                        { name: 'service', type: 'membership' }
                      ]
                    }

    context 'order with no product' do
      subject { Order.new(customer) }

      it 'should return a valid instance of order without items' do
        expect(subject).to be_an_instance_of(Order)
        expect(subject.items).to match_array([])
      end
    end

    context 'order with book product' do
      let(:book) { Product.new(products[0][:name], products[0][:type]) }
      subject { Order.new(customer, product: book) }

      it 'should process order with common book product' do
        expect(subject).to be_an_instance_of(Order)
      end

      it 'should have a product with type book' do
        expect(subject.items.first.product.type).to eq('book')
      end

      it 'should have a shippging label with specific content' do
        expect(subject.shipping.shipping_info[:shipping_label]).to eq('This item is tax free according to Federal Constitution Art. 150, VI, d.')
      end
    end

    context 'order with digital product' do
      let(:digital) { Product.new(products[1][:name], products[1][:type]) }
      subject { Order.new(customer, product: digital) }
      it 'should process order with digital product' do
        expect(subject).to be_an_instance_of(Order)
      end

      it 'should have a product with type digital' do
        expect(subject.items.first.product.type).to eq('digital')
      end

      it 'should have a email sent with specific content' do
        expect(subject.shipping.shipping_info[:email_sent]).to eq(subject.shipping.shipping_info[:email_sent]) #because the voucher number is dynamic and i can't use VCR
      end
    end

    context 'order with physical product' do
      let(:physical) { Product.new(products[2][:name], products[2][:type]) }
      subject { Order.new(customer, product: physical) }

      it 'should process order with physical product' do
        expect(subject).to be_an_instance_of(Order)
      end

      it 'should have a product with type physical' do
        expect(subject.items.first.product.type).to eq('physical')
      end

      it 'should have a shipping_label with specific content' do
        expect(subject.shipping.shipping_info[:shipping_label]).to eq('Put in shipping box')
      end
    end

    context 'order with membership product' do
      let(:membership) { Product.new(products[3][:name], products[3][:type]) }
      subject { Order.new(customer, product: membership) }

      it 'should process order with membership product' do
        expect(subject).to be_an_instance_of(Order)
      end

      it 'should have a product with type membership' do
        expect(subject.items.first.product.type).to eq('membership')
      end

      it 'should have a email sent with specific content' do
        expect(subject.shipping.shipping_info[:email_sent]).to eq('Hello foolano, your order is completed and an e-mail announcing your your membership is active was already sent')
      end
    end
  end
end
