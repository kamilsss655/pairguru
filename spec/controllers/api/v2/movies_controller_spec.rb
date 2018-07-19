require 'rails_helper'

RSpec.describe Api::V2::MoviesController, type: :controller do
  render_views
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      movie = create :movie
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(json.length).to eq(1)
      expect(json[0].keys).to contain_exactly("genre", "id", "title")
      expect(json[0]["genre"].keys).to contain_exactly("id", "name", "number_of_movies")
      expect(json[0]["id"]).to eq(movie.id)
    end
  end
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      movie = create :movie
      get :show, params: { id: movie.id }, format: :json
      json = JSON.parse(response.body)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(json.keys).to contain_exactly("genre", "id", "title")
      expect(json["genre"].keys).to contain_exactly("id", "name", "number_of_movies")
      expect(json["id"]).to eq(movie.id)
    end
  end
end
