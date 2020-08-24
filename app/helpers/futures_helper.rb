module FuturesHelper
  def predicted_year(future)
    if future.predicted_year.blank?
      return '?'
    else
      return future.predicted_year
    end
  end
end
