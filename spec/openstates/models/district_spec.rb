require 'spec_helper'

describe OpenStates::District do
  describe ".api_method" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::District.api_method }.not_to raise_error
    end
  end

  describe ".id_key" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::District.id_key }.not_to raise_error
    end
  end

  describe ".find" do
    before(:each) do
      allow(OpenStates).to receive(:district_boundaries).and_return({state: 'il'})
    end

    context "without a boundary id" do
      it "returns nil" do
        expect(OpenStates::District.find(nil)).to be_nil
      end
    end

    context "with a boundary id" do
      it "returns an OpenState::District" do
        options = {state: 'il'}
        expect(OpenStates::District.find(options)).to be_a OpenStates::District
      end
    end
  end
end
