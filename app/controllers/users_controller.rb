class UsersController < ApplicationController
  before_action :ensure_admin, only: [:index, :edit, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if(@user.update(edit_user_params))
      redirect_to(users_path)
    else
      'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    # Search all Futures owned by this User.
    nb_futures = @user.futures.all.length
    for future_index in 0..(nb_futures -1) do

      # Search and delete all the Outcomes of these Futures.
      nb_outcomes = @user.futures[future_index].outcomes.all.length
      for outcome_index in 0..(nb_outcomes -1) do
        @user.futures[future_index].outcomes[outcome_index].destroy!
      end

      # Search and delete all the Comments of these Futures.
      nb_comments = @user.futures[future_index].comments.all.length
      for comment_index in 0..(nb_comments -1) do
        @user.futures[future_index].comments[comment_index].destroy!
      end

      # Delete all the Futures owned by this User.
      @user.futures[future_index].destroy!
    end

    # Search and delete all remaining Comments created by this User.
    nb_comments = @user.comments.all.length
    for comment_index in 0..(nb_comments -1) do
      @user.comments[comment_index].destroy!
    end

    # When a User deletes his/her own account, logout before delete.
    if @user == current_user
      session.delete(:user_id)
      @user.destroy!
      redirect_to(root_path)
    else
      @user.destroy!
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def edit_user_params
    params.require(:user).permit(:email, :name, :role)
  end

  def ensure_admin
    if(current_user.role == 'admin')
      return
    end

    redirect_to(account_path)
  end
end
