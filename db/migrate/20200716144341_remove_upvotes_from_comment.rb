class RemoveUpvotesFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :upvotes, :integer
  end
end
