require "rails_helper"

describe PairguruApiHandler do
  let(:handler) { PairguruApiHandler.new("Django") }
  context "remote api response is valid", mock_api: true do
    it "responds with cover url" do
      expect(handler.cover).to eq "https://pairguru-api.herokuapp.com//pulp_fiction.jpg"
    end
    it "responds with rating" do
      expect(handler.rating).to eq 8.9
    end
    it "responds with plot" do
      expect(handler.plot).to eq "The lives of two mob hit men, a boxer..."
    end
  end
  context "remote api response is invalid", mock_invalid_api_response: true do
    it "responds with empty cover if response is invalid" do
      expect(handler.cover).to eq nil
    end
    it "responds with empty rating if response is invalid" do
      expect(handler.rating).to eq nil
    end
    it "responds with empty plot if response is invalid" do
      expect(handler.plot).to eq nil
    end
  end
end
