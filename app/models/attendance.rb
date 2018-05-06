class Attendance < ActiveRecord::Base

  belongs_to :student
  belongs_to :session
  belongs_to :course

  validates :student_id, presence: true
  validates :session_id, presence: true

end
