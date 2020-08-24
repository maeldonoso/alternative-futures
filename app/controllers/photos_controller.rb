class PhotosController < ApplicationController
  include RolesHelper

  before_action :ensure_authenticated
  before_action :load_future
  before_action :authorize_to_use_photos

  def index
    @query = params[:query]
    @query = @future.title if @query.blank?
    @photos = Unsplash::Photo.random(query: @query, count: 6)
  end

  def create
    @future.update_attributes photo_url: params[:photo_url]
    redirect_to edit_future_path(@future)
  end

  private

  def load_future
    @future = Future.find(params[:future_id])
  end

  def authorize_to_use_photos
    redirect_to(account_path) unless(can_edit?(@future))
  end
end
