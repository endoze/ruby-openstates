require 'spec_helper'

describe OpenStates::VERSION do
  it "should return a version string" do
    OpenStates::VERSION.class.should == String
  end
end


