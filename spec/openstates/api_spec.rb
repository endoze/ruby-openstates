require "spec_helper"

describe OpenStates::Api do
  before { OpenStates.stub(:get).and_return({}) }

  describe ".metadata" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.metadata
    end

    context "without a state passed" do
      it "should call .get with 'metadata/'" do
        expect(OpenStates).to receive(:get).with("metadata/")
        OpenStates.metadata
      end
    end

    context "with a state passed in" do
      it "should call .get with 'metadata/in/'" do
        state = "in"
        expect(OpenStates).to receive(:get).with("metadata/#{state}/")
        OpenStates.metadata(state)
      end
    end
  end

  describe ".bills" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.bills
    end

    context "without an options hash passed" do
      it "should call .get with 'bills/' and an empty hash" do
        expect(OpenStates).to receive(:get).with("bills/", {})
        OpenStates.bills
      end
    end

    context "with an options hash passed" do
      it "should call .get with 'bills/in/summer/10' and an options hash" do
        options = {:state => "in", :session => "summer", :bill_id => 10}
        expect(OpenStates).to receive(:get).with("bills/#{options[:state]}/#{options[:session]}/#{options[:bill_id]}", options)
        OpenStates.bills(options)
      end
    end
  end

  describe ".legislators" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.legislators
    end

    context "without an options hash passed" do
      it "should call .get with 'legislators/' and an empty hash" do
        expect(OpenStates).to receive(:get).with("legislators/", {})
        OpenStates.legislators
      end
    end

    context "with an options hash passed" do
      it "should call .get with 'legislators/' and an options hash" do
        options = {:leg_id => 1}
        expect(OpenStates).to receive(:get).with("legislators/#{options[:leg_id]}/", options)
        OpenStates.legislators(options)
      end
    end
  end

  describe ".geo_legislators" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.geo_legislators(nil, nil)
    end

    it "should call .get with 'legislators/geo/' and a hash with lat/lon" do
      lat, lon = 10,10
      expect(OpenStates).to receive(:get).with("legislators/geo/", {:lat => lat, :long => lon})
      OpenStates.geo_legislators(lat, lon)
    end
  end

  describe ".committees" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.committees
    end

    context "without an options hash passed" do
      it "should call .get with 'committees/' and an empty hash" do
        expect(OpenStates).to receive(:get).with("committees/", {})
        OpenStates.committees
      end
    end

    context "with an options hash passed" do
      it "should call .get with 'committees/' and an options hash" do
        options = {:committee_id => 1}
        expect(OpenStates).to receive(:get).with("committees/#{options[:committee_id]}/", options)
        OpenStates.committees(options)
      end
    end
  end

  describe ".events" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.events
    end

    context "without an options hash passed" do
      it "should call .get with 'events/' and an empty hash" do
        expect(OpenStates).to receive(:get).with("events/", {})
        OpenStates.events
      end
    end

    context "with an options hash passed" do
      it "should call .get with 'events/' and an options hash" do
        options = {:event_id => 1}
        expect(OpenStates).to receive(:get).with("events/#{options[:event_id]}/", options)
        OpenStates.events(options)
      end
    end
  end

  describe ".districts" do
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.districts
    end

    context "without an options hash passed" do
      it "should call .get with 'districts/' and an empty hash" do
        expect(OpenStates).to receive(:get).with("districts/", {})
        OpenStates.districts
      end
    end

    context "with an options hash passed" do
      context "with a state key only" do
        it "should call .get with 'districts/' and an options hash" do
          options = {:state => 'in'}
          expect(OpenStates).to receive(:get).with("districts/#{options[:state]}/", options)
          OpenStates.districts(options)
        end
      end

      context "with a state and chamber key" do
        it "should call .get with 'districts/' and an options hash" do
          options = {:state => 'in', :chamber => "blah"}
          expect(OpenStates).to receive(:get).with("districts/#{options[:state]}/#{options[:chamber]}/", options)
          OpenStates.districts(options)
        end
      end
    end
  end

  describe ".district_boundaries" do
    let(:boundary_id) { 1 }
    it "should call .get on OpenStates" do
      expect(OpenStates).to receive(:get)
      OpenStates.district_boundaries(boundary_id)
    end

    context "with a boundary_id parameter" do
      it "should call .get with 'districts/:boundary_id'" do
        expect(OpenStates).to receive(:get).with("districts/boundary/#{boundary_id}")
        OpenStates.district_boundaries(boundary_id)
      end
    end

    context "without a boundary_id parameter" do
      it "should return nil" do
        expect(OpenStates.district_boundaries(nil)).to be_nil
      end
    end
  end
end
