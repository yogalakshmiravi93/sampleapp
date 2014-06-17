class CreateNewwordstables < ActiveRecord::Migration
  def change
    create_table :newwordstables do |t|
      t.string :category
      t.string :ans
      t.string :hint
      t.boolean :status

      t.timestamps
    end
  end
end
