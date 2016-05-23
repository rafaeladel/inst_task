class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.text :app_token
      t.integer :bug_number
      t.integer :bug_status
      t.integer :bug_priority
      t.datetime :bug_list_updated_at
      t.timestamps null: false

      t.index [:app_token, :bug_number], length: { app_token: 10}
    end
  end
end
