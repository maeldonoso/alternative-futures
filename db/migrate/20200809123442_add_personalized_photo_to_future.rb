class AddPersonalizedPhotoToFuture < ActiveRecord::Migration[5.1]
  def change
    add_column :futures, :personalized_photo, :string
  end
end
