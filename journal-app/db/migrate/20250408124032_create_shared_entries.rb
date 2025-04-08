class CreateSharedEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :shared_entries do |t|
      t.integer :user_id, null: false
      t.integer :entry_id, null: false
      t.timestamps
    end

    add_index :shared_entries, :user_id
    add_index :shared_entries, :entry_id
    add_foreign_key :shared_entries, :users
    add_foreign_key :shared_entries, :entries
  end
end
