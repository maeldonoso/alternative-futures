class OutcomesController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :load_future,                 only: [:new, :create, :edit, :update, :destroy]
  before_action :load_outcome,                only: [:edit, :update, :destroy]
  before_action :authorize_to_edit_outcome

  def new
    @outcome = Outcome.new
  end

  def create
    @outcome = Outcome.new(outcome_params)
    @outcome.future = @future
    if(@outcome.save)
      redirect_to(edit_future_path(@future))
    else
      render 'new'
    end
  end

  def update
    if @outcome.update(outcome_params)
      redirect_to edit_future_path(@future)
    else
      redirect_to edit_future_outcome_path(@future, @outcome)
    end
  end

  def destroy
    @outcome.destroy!
  end

  private

  def outcome_params
    params.require(:outcome).permit(:impact, :description)
  end

  def load_future
    @future = Future.find(params[:future_id])
  end

  def load_outcome
    @outcome = Outcome.find(params[:id])
  end

  def authorize_to_edit_outcome
    redirect_to(account_path) unless(can_edit?(@future))
  end
end
