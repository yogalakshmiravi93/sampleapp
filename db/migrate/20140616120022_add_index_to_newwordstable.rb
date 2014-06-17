class AddIndexToNewwordstable < ActiveRecord::Migration
  def change
  	add_index :newwordstables,:ans, unique:true
  end
end
