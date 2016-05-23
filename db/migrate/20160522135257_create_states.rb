class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :bug
      t.foreign_key :bugs, on_delete: :cascade
      t.string :device
      t.string :os
      t.integer :memory
      t.integer :storage
      t.timestamps null: false
    end
  end
end
