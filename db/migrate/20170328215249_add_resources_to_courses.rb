class AddResourcesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :resources, :text
  end
end
