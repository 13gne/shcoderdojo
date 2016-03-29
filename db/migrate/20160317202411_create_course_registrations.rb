class CreateCourseRegistrations < ActiveRecord::Migration
  def change
    create_table :course_registrations do |t|
      t.integer :user_id
      t.integer :student_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
