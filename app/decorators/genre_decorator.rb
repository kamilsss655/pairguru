class GenreDecorator < Draper::Decorator
  delegate_all
  decorates_association :movies

  # TODO Consider usage of counter cache for production usage.
  def number_of_movies
    object.movies.count
  end
end
