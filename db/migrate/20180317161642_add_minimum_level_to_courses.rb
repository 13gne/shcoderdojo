class AddMinimumLevelToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :minimum_level, :integer
  end
end
