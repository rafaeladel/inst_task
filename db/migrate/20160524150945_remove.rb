class Remove < ActiveRecord::Migration
  def change
    remove_column :bugs, :bug_list_updated_at
  end
end
