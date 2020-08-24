class UpvotedCommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @comment = Comment.find(params[:comment_id])
    future = @comment.future
    if user.upvoted_comments.exists?(@comment.id) == false
      user.upvoted_comments << @comment
    end
  end

  def destroy
    user = User.find(params[:user_id])
    @comment = Comment.find(params[:comment_id])
    future = @comment.future
    if user.upvoted_comments.exists?(@comment.id)
      user.upvoted_comments.destroy @comment
    end
  end
end
