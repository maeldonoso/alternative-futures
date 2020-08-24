class FuturesController < ApplicationController
  include RolesHelper
  include ScoreHelper

  before_action :ensure_authenticated,     only: [:new, :create, :edit, :update]
  before_action :load_future,              only: [:show, :edit, :update, :destroy]
  before_action :authorize_to_edit_future, only: [:edit, :update, :destroy]
  before_action :compute_future_score,     only: [:show]

  def index
    @search_term = params[:q]
    @futures = Future.search(@search_term).page(params[:page])
  end

  def show
    @comment = Comment.new
    @display_user_features = session[:user_id].present?
  end

  def new
    @future = Future.new
  end

  def create
    user = User.find(session[:user_id])
    @future = Future.new(future_params)
    @future.user = user
    if(@future.save)
      redirect_to(edit_future_path(@future))
    else
      render 'new'
    end
  end

  def edit
    @outcome = Outcome.new
  end

  def update
    if(@future.update(future_params))
      redirect_to(account_futures_path)
    else
      render 'edit'
    end
  end

  def destroy
    # Search and delete all the Outcomes of the Future.
    nb_outcomes = @future.outcomes.all.length
    for outcome_index in 0..(nb_outcomes -1) do
      @future.outcomes[outcome_index].destroy!
    end

    # Search and delete all the Comments of the Future.
    nb_comments = @future.comments.all.length
    for comment_index in 0..(nb_comments -1) do
      @future.comments[comment_index].destroy!
    end

    @future.destroy!
    redirect_to(account_futures_path)
  end

  private

  # White list of parameters allowed for mass assignment
  def future_params
    params.require(:future).permit(
      :title, :description, :predicted_year, :photo_url, :personalized_photo)
  end

  def load_future
    @future = Future.find(params[:id])
  end

  def authorize_to_edit_future
    redirect_to(account_path) unless(can_edit?(@future))
  end
end
