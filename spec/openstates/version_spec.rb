require 'spec_helper'

describe OpenStates::VERSION do
  it "Returns a version string" do
    expect(OpenStates::VERSION.class).to eq(String)
  end
end


