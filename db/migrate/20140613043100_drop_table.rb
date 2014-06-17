class DropTable < ActiveRecord::Migration
  def up
  	drop_table :scores
  end

  def down
  end
end
