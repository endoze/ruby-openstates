require 'spec_helper'

describe OpenStates::Bill do
  describe ".api_method" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::Bill.api_method }.not_to raise_error
    end
  end

  describe ".id_key" do
    it "does not raise a NotImplementedError" do
      expect { OpenStates::Bill.id_key }.not_to raise_error
    end
  end

  describe ".bill_details" do
    context "when state, session, and bill_id are nil" do
      it "returns nil" do
        expect(OpenStates::Bill.bill_details(nil, nil, nil)).to be_nil
      end
    end

    context "when state, session, and bill_id are not nil" do
      it "returns an OpenState::Bill" do
        state = 'fl'
        session = '2013'
        bill_id = '1234'

        allow(OpenStates).to receive(:bills).and_return(
          {bill_id: bill_id, state: state, session: session}
        )

        expect(
          OpenStates::Bill.bill_details(state, session, bill_id)
        ).to be_a described_class
      end
    end
  end

  describe ".find_by_openstates_id" do
    context "openstates id is legit" do
      it "returns a Bill" do

        openstate_bill_id = 'KSB00005007'

        allow(OpenStates).to receive(:bill).and_return(
          {id: openstate_bill_id}
        )

        expect(
          OpenStates::Bill.find_by_openstates_id("KSB00005007")
        ).to be_a described_class
      end
    end

    context "when openstate_bill_id is nil" do
      it "returns nil" do
        expect(OpenStates::Bill.find_by_openstates_id(nil)).to be_nil
      end
    end
  end
end
