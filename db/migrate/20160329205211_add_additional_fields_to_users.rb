class AddAdditionalFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :parent_name, :string
    add_column :users, :grade, :string
    add_column :users, :experience, :string
    add_column :users, :mobile_number, :string
  end
end
