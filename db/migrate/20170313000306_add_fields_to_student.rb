class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :grade, :string
    add_column :students, :experience, :string
  end
end
