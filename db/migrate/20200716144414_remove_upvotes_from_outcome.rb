class RemoveUpvotesFromOutcome < ActiveRecord::Migration[5.1]
  def change
    remove_column :outcomes, :upvotes, :integer
  end
end
