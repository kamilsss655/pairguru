class PairguruApiHandler
  include HTTParty
  attr_reader :movie_title
  base_uri "https://pairguru-api.herokuapp.com/api/v1/movies"
  COVER_URI = "https://pairguru-api.herokuapp.com".freeze

  def initialize(movie_title)
    @movie_title = movie_title
  end

  def cover
    cover_path = api_response.dig("data", "attributes", "poster")
    return nil if cover_path.nil?
    "#{COVER_URI}/#{cover_path}"
  end

  def rating
    api_response.dig("data", "attributes", "rating")
  end

  def plot
    api_response.dig("data", "attributes", "plot")
  end

  private

  # API call memoization to make sure we call API once per movie
  def api_response
    @api_response ||= self.class.get(movie_url).parsed_response
  end

  def movie_url
    "/#{@movie_title.gsub(' ', '%20')}"
  end
end
