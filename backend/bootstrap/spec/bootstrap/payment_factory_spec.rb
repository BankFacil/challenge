require "spec_helper"

describe BootStrap::PaymentFactory do

  describe "#create" do
    describe "book" do
      let(:item) do
        OpenStruct.new({ name: "Awsomebook", type: :book })
      end

      subject { described_class }

      it 'returns a new payment of book' do
        expect(subject.create(item)).to be_a(BootStrap::PaymentBook)
      end
    end

    describe "item" do
      let(:item) do
        OpenStruct.new({ name: "Awsomeitem", type: :item })
      end

      subject { described_class }

      it 'returns a new payment of an item' do
        expect(subject.create(item)).to be_a(BootStrap::PaymentItem)
      end
    end

    describe "signature" do
      let(:item) do
        OpenStruct.new({ name: "Awsomesignature", type: :signature })
      end

      subject { described_class }

      it 'returns a new payment of an signature' do
        expect(subject.create(item)).to be_a(BootStrap::PaymentSignature)
      end
    end

    describe "digital" do
      let(:item) do
        OpenStruct.new({ name: "AwsomeDigitalMidia", type: :digital })
      end

      subject { described_class }

      it 'returns a new payment of an digital midia' do
        expect(subject.create(item)).to be_a(BootStrap::PaymentDigital)
      end
    end
  end
end
