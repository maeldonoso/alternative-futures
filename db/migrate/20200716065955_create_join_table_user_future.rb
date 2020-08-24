class CreateJoinTableUserFuture < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :futures do |t|
      # t.index [:user_id, :future_id]
      # t.index [:future_id, :user_id]
    end
  end
end
