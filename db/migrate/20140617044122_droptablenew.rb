class Droptablenew < ActiveRecord::Migration
  def up
  	drop_table :newwords
  end

  def down
  end
end
