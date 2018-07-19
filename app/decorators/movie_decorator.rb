class MovieDecorator < Draper::Decorator
  delegate_all
  decorates_association :genre
  def cover
    "http://lorempixel.com/100/150/" +
      %w[abstract nightlife transport].sample +
      "?a=" + SecureRandom.uuid
  end
end
