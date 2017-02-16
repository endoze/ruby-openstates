require 'spec_helper'

describe OpenStates::Event do
  describe ".api_method" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::Event.api_method }.not_to raise_error
    end
  end

  describe ".id_key" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::Event.id_key }.not_to raise_error
    end
  end
end
