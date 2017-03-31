# == Schema Information
#
# Table name: course_registrations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  student_id :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CourseRegistration < ActiveRecord::Base
  belongs_to :user
  belongs_to :student
  belongs_to :course

  validates :user_id, :student_id, :course_id, presence: true
  validates :student_id, uniqueness: { scope: :course_id, message: "can't sign up for the same course more than once"}
end
