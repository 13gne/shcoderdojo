# == Schema Information
#
# Table name: student_achievements
#
#  achievement_id :integer
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  student_id     :integer
#  updated_at     :datetime         not null
#

class StudentAchievement < ActiveRecord::Base
  belongs_to :student
  belongs_to :achievement

  validates :student_id, presence: true
  validates :achievement_id, presence: true

  delegate :name, to: :achievement
end
