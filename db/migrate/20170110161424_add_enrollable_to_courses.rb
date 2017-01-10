class AddEnrollableToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :enrollable, :boolean, default: true
  end
end
