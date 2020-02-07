require "spec_helper"

describe BootStrap::PaymentBook do

  let(:item) do
    OpenStruct.new({ name: "Awsomebook", type: :book })
  end

  subject { described_class.new(item) }

  describe "#pay" do
    it 'returns a book payment' do
      expect(subject.pay).to eq("Shipping isento de imposto")
    end
  end
end
