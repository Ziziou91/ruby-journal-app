class AddUserIdToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :user_id, :integer
    add_index :entries, :user_id
    add_foreign_key :entries, :users
  end
end
