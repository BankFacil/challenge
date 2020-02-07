require "spec_helper"

RSpec.describe Bootstrap do
  it "has a version number" do
    expect(Bootstrap::VERSION).not_to be nil
  end
end
