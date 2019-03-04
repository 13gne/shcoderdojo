class AddBagAchievementToStudents < ActiveRecord::Migration
  def change
    add_column :students, :bag_achievement, :boolean, default: false
  end
end
