class MovieDecorator < Draper::Decorator
  delegate_all

  def extra_info
    @extra_info ||= PairguruApiHandler.new(object.title)
  end

  def cover
    extra_info.cover
  end

  def plot
    extra_info.plot
  end

  def rating
    extra_info.rating
  end
end
