class CreateNewwords < ActiveRecord::Migration
  def change
    create_table :newwords do |t|
      t.string :category
      t.string :ans
      t.string :hint

      t.timestamps
    end
  end
end
