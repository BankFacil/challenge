require "spec_helper"

describe BootStrap::PaymentItem do

  let(:item) do
    OpenStruct.new({ name: "Awsomebook", type: :item })
  end

  subject { described_class.new(item) }

  describe "#pay" do
    it 'returns a item payment' do
      expect(subject.pay).to eq("Shipping para caixa de envio")
    end
  end
end
