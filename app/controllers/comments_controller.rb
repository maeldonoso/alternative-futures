class CommentsController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :load_future,               only: [:create, :destroy]
  before_action :authorize_to_edit_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.future = @future
    @comment.save!

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!

    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_future
    @future = Future.find(params[:future_id])
  end

  def authorize_to_edit_comment
    redirect_to(account_path) unless(can_edit?(@future))
  end
end
