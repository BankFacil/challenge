require "spec_helper"

describe BootStrap::Order do

  let(:customer) do
    OpenStruct.new(
      {
        name: "foolano",
        address:
        {
          zipcode: 00000,
        }
      }
    )
  end

  let(:product) do
     BootStrap::Product.new( "nome", :book, 1)
  end

  subject { described_class.new(customer) }

  describe "#add_product" do
    it 'add product' do
      expect(subject.add_product(product)).to eq([product])
    end
  end

  describe "#total_amount" do
    it 'returns total amount' do
      subject.add_product(product)
      expect(subject.total_amount).to eq(1)
    end
  end

  describe "#close" do
    it 'set close at' do
      expect(subject.close).to be_a(Time)
    end
  end
end
