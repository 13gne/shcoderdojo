# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  name         :string
#  start_date   :date
#  end_date     :date
#  description  :text
#  max_students :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Course < ActiveRecord::Base
  has_many :course_registrations, dependent: :destroy
  has_many :sessions, dependent: :destroy
  has_many :students, through: :course_registrations
  has_many :attendances, through: :sessions

  validates :name, presence: true
  validates :description, presence: true
  validates :max_students, numericality: true

  def seats_remaining
    [self.max_students - self.course_registrations.count, 0].max
  end

  def deletable?
    self.students.count == 0
  end

  def minimum_achievement_title
    unless self.minimum_level.nil? || self.minimum_level == 0
      Achievement.find(self.minimum_level).name
    end
  end
end
