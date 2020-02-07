require "spec_helper"

describe BootStrap::PaymentSignature do

  let(:item) do
    OpenStruct.new({ name: "Signature", type: :signature }) 
  end

  subject { described_class.new(item) }

  describe "#pay" do
    it 'returns a item payment' do
      expect(subject.pay).to eq("Ativar a assinatura e notificar o usuário por email")
    end
  end
end
