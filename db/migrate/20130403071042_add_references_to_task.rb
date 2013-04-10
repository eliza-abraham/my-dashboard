class AddReferencesToTask < ActiveRecord::Migration
  def up
  	add_column :tasks, :list_id, :integer
  	add_index :tasks, :list_id
  end

  def down
  	remove_column :tasks, :list_id
  	remove_index :tasks, :list_id
  end
end
