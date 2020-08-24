class CreateFutures < ActiveRecord::Migration[5.1]
  def change
    create_table :futures do |t|
      t.string :title
      t.string :description
      t.integer :predicted_year
      t.string :photo_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
