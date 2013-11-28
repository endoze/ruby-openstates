require 'spec_helper'

describe OpenStates::Legislator do
  describe ".api_method" do
    it "should not raise a NotImplementedError" do
      expect{ OpenStates::Legislator.api_method }.not_to raise_error
    end
  end

  describe ".id_key" do
    it "should not raise a NotImplementedError" do
      expect{ OpenStates::Legislator.id_key }.not_to raise_error
    end
  end

  describe ".by_location" do
    context "when lat and lon are nil" do
      it "should return nil" do
        OpenStates::Legislator.by_location(nil,nil).should be_nil
      end
    end

    context "when lat and lon are not nil" do
      before(:each) do
        legislator_hash = {leg_id: '1', first_name: 'bob'}
        response = [legislator_hash, legislator_hash]
        OpenStates.stub(:geo_legislators).and_return(response)
      end

      it "should return an array" do
        OpenStates::Legislator.by_location(123.10, -85.20).should be_an Array
      end

      it "should return an array of legislator objects" do
        OpenStates::Legislator.by_location(123.10, -85.20).each do |obj|
          obj.should be_a OpenStates::Legislator
        end
      end
    end
  end
end
