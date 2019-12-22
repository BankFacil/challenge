require 'spec_helper'

describe CreditCard do
  let(:code) { '43567890-987654367' }

  it "generates credit card by hash code" do
    expect(CreditCard.fetch_by_hashed(:code)).to be_an_instance_of(CreditCard)
  end

end
