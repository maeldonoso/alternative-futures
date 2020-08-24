class UpvotedFuturesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @future = Future.find(params[:future_id])
    if user.upvoted_futures.exists?(@future.id) == false
      user.upvoted_futures << @future
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @future = Future.find(params[:future_id])
    if user.upvoted_futures.exists?(@future.id)
      user.upvoted_futures.destroy @future
    end
  end
end
