class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :course_id
      t.datetime :session_date
      t.text :notes

      t.timestamps null: false
    end
  end
end
