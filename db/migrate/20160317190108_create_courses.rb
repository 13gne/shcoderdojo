class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.integer :max_students

      t.timestamps null: false
    end
  end
end
