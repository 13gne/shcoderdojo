class AddWaitlistToCourseRegistrations < ActiveRecord::Migration
  def change
    add_column :course_registrations, :waitlist, :boolean, default: false
  end
end
