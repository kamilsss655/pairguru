require "rails_helper"

describe PairguruApiHandler do
  it "responds with parsed data", mock_api: true do
    handler = PairguruApiHandler.new("Django")
    expect(handler.cover).to eq "https://pairguru-api.herokuapp.com//pulp_fiction.jpg"
    expect(handler.rating).to eq 8.9
    expect(handler.plot).to eq "The lives of two mob hit men, a boxer..."
  end
end
