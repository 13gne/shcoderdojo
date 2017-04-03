# == Schema Information
#
# Table name: sessions
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  session_date :datetime
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  end_time     :datetime
#

class Session < ActiveRecord::Base
  belongs_to :course
  has_many :attendances

  def attended_by_student?(student_id)
    Attendance.where(session_id: self.id, student_id: student_id).first || false
  end
end
