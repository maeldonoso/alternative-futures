module ScoreHelper
  def compute_future_score
    @future_score = 0
    nb_outcome_upvotes = 0
    @future.outcomes.each do |outcome|
      if outcome.impact == 'positive'
        @future_score += (100 * outcome.users.length)
        nb_outcome_upvotes += outcome.users.length
      elsif outcome.impact == 'neutral'
        @future_score += (50 * outcome.users.length)
        nb_outcome_upvotes += outcome.users.length
      elsif outcome.impact == 'negative'
        nb_outcome_upvotes += outcome.users.length
      end
    end
    if nb_outcome_upvotes == 0
      @future_score = 50
    else
      @future_score = @future_score / nb_outcome_upvotes
    end
  end
end
