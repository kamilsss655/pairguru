class PairguruApiHandler
  include HTTParty
  attr_reader :movie, :response
  base_uri "https://pairguru-api.herokuapp.com/api/v1/movies"
  POSTER_URI = "https://pairguru-api.herokuapp.com".freeze
  def initialize(movie)
    @movie = movie
  end

  def cover
    "#{POSTER_URI}/#{api_response['attributes']['poster']}"
  end

  def rating
    api_response["attributes"]["rating"]
  end

  def plot
    api_response["attributes"]["plot"]
  end

  private

  # API call memoization to make sure we call API once per movie
  def api_response
    @response ||= self.class.get(movie_url).parsed_response["data"]
  end

  def movie_url
    "/#{@movie.gsub(' ', '%20')}"
  end
end
