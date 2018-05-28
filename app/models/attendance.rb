# == Schema Information
#
# Table name: attendances
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  session_id :integer
#  student_id :integer
#  updated_at :datetime         not null
#

class Attendance < ActiveRecord::Base

  belongs_to :student
  belongs_to :session
  belongs_to :course

  validates :student_id, presence: true
  validates :session_id, presence: true

end
