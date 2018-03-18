# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  belongs_to :user
  has_many :course_registrations, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :student_achievements, dependent: :destroy
  has_many :courses, :through => :attendances

  validates :user_id, presence: true
  validates :name, presence: true

  def achievement_with_maximum_level
    maximum_level = 0
    maximum_achievement = Achievement.new
    self.student_achievements.each do |student_achievement|
      if student_achievement.achievement.level > maximum_level
        maximum_level = student_achievement.achievement.level
        maximum_achievement = student_achievement.achievement
      end
    end
    maximum_achievement
  end
end
