require "rails_helper"

describe "Genres requests", type: :request do
  let!(:genres) { create_list(:genre, 5, :with_movies) }

  describe "genre list" do
    it "displays only related movies", mock_api: true do
      stubbed_response = { "data":
                          { "id": "1",
                            "type": "movie",
                            "attributes":
                              { "title": "Pulp Fiction",
                                "plot": "The lives of two mob hit men, a boxer...",
                                "rating": 8.9,
                                "poster": "/pulp_fiction.jpg" } } }
      stub_request(:get, /pairguru-api.herokuapp.com/)
        .with(headers: { "Accept": "*/*", "User-Agent": "Ruby" })
        .to_return(status: 200,
                   body: stubbed_response.to_json,
                   headers: { "Content-Type": "application/json" })
      visit "/genres/" + genres.sample.id.to_s + "/movies"
      expect(page).to have_selector("table tr", count: 5)
    end
  end
end
