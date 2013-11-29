require 'spec_helper'

describe OpenStates::Bill do
  describe ".api_method" do
    it "should not raise a NotImplementedError" do
      expect{ OpenStates::Bill.api_method }.not_to raise_error
    end
  end

  describe ".id_key" do
    it "should not raise a NotImplementedError" do
      expect{ OpenStates::Bill.id_key }.not_to raise_error
    end
  end

  describe ".bill_details" do
    context "when state, session, and bill_id are nil" do
      it "should return nil" do
        expect(OpenStates::Bill.bill_details(nil, nil, nil)).to be_nil
      end
    end

    context "when state, session, and bill_id are not nil" do
      it "should return an OpenState::Bill" do
        state = 'fl'
        session = '2013'
        bill_id = '1234'
        OpenStates.stub(:bills).and_return({:bill_id => bill_id, :state => state, :session => session})
        OpenStates::Bill.bill_details(state, session, bill_id).should be_a OpenStates::Bill
      end
    end
  end
end
