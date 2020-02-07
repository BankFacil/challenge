require "spec_helper"

describe BootStrap::Payment do

  let(:order) do
    object_double(BootStrap::Order.new(BootStrap::Customer.new) , items: [ OpenStruct.new({ name: "Awsomebook", type: :book }) ] )
  end

  let(:payment) do
    OpenStruct.new(
      {
        order:          order,
        payment_method: 'credicard'
      }
    )
  end

  subject { described_class.new(payment) }

  describe "paying" do
    it 'returns a book payment routine' do
      expect(subject.pay.first).to eq("Shipping isento de imposto")
      expect(subject.paid?).not_to be_falsey
    end
  end
end
