require "spec_helper"

describe BootStrap::PaymentDigital do

  let(:item) do
    OpenStruct.new({ name: "Digital midia", type: :digital })
  end

  subject { described_class.new(item) }

  describe "#pay" do
    it 'returns a item payment' do
      expect(subject.pay).to eq("Enviar email com descrição da compra e vaucher de desconto")
    end
  end
end
