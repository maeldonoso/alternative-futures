class CreateOutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :outcomes do |t|
      t.string :impact
      t.string :description
      t.integer :upvotes
      t.references :future, foreign_key: true

      t.timestamps
    end
  end
end
