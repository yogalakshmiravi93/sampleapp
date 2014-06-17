class CreateJumbleds < ActiveRecord::Migration
  def change
    create_table :jumbleds do |t|
      t.string :category
      t.string :ans
      t.string :hint

      t.timestamps
    end
  end
end
