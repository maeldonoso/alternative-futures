class CreateJoinTableUserOutcome < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :outcomes do |t|
      # t.index [:user_id, :outcome_id]
      # t.index [:outcome_id, :user_id]
    end
  end
end
