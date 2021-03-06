class StudentAchievement < ActiveRecord::Base
  belongs_to :student
  belongs_to :achievement

  validates :student_id, presence: true
  validates :achievement_id, presence: true

  delegate :name, to: :achievement
end
