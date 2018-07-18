class PairguruApiHandler
  include HTTParty
  attr_reader :movie, :response
  base_uri "https://pairguru-api.herokuapp.com/api/v1/movies"
  POSTER_URI = "https://pairguru-api.herokuapp.com".freeze
  def initialize(movie)
    @movie = movie
  end

  def cover
    "#{POSTER_URI}/#{call_api['attributes']['poster']}"
  end

  def rating
    call_api["attributes"]["rating"]
  end

  def plot
    call_api["attributes"]["plot"]
  end

  private

  # API call memoization to make sure we call API once per movie
  def call_api
    if @response.nil?
      @response = self.class.get(movie_url).parsed_response["data"]
    else
      @response
    end
  end

  def movie_url
    "/#{@movie.gsub(' ', '%20')}"
  end
end
