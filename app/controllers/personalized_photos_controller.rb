class PersonalizedPhotosController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :load_future
  before_action :authorize_to_use_photos

  def destroy
    @future.remove_personalized_photo!
    @future.save!
    redirect_to(account_futures_path)
  end

  private

  def load_future
    @future = Future.find(params[:future_id])
  end

  def authorize_to_use_photos
    redirect_to(account_path) unless(can_edit?(@future))
  end
end
