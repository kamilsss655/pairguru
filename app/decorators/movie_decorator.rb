class MovieDecorator < Draper::Decorator
  delegate_all

  def pairguru_api_info
    @pairguru_api_info ||= PairguruApiHandler.new(object.title)
  end

  def cover
    pairguru_api_info.cover
  end

  def plot
    pairguru_api_info.plot
  end

  def rating
    pairguru_api_info.rating
  end
end
