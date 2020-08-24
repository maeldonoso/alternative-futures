class UpvotedOutcomesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @outcome = Outcome.find(params[:outcome_id])
    future = @outcome.future
    if user.upvoted_outcomes.exists?(@outcome.id) == false
      user.upvoted_outcomes << @outcome
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @outcome = Outcome.find(params[:outcome_id])
    future = @outcome.future
    if user.upvoted_outcomes.exists?(@outcome.id)
      user.upvoted_outcomes.destroy @outcome
    end
  end
end
