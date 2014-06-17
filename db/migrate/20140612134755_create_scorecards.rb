class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.references :user
      t.integer :fruit
      t.integer :vegetable

      t.timestamps
    end
    add_index :scorecards, :user_id
  end
end
