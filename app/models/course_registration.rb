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
  validate :minimum_level_achieved

  def count_student_attendances
    Attendance.where(student_id: self.student_id, session_id: self.course.sessions).count
  end

  def self.to_csv
    CSV.generate do |csv|
      Rails.logger.debug "MAKING A CSV"
      csv << [
        "Student",
        "Parent",
        "Email",
        "Grade",
        "Experience",
        "Mobile Number"]
      all.each do |result|
        csv << [
          result.student.name,
          result.user.name,
          result.user.email,
          result.student.grade,
          result.student.experience,
          result.user.mobile_number]
      end
    end
  end

  private

  def minimum_level_achieved
    student_achievement_with_maximum_level = student.achievement_with_maximum_level.level

    if course.minimum_level.nil?
      course_minimum_level = 0
    else
      course_minimum_level = Achievement.find(course.minimum_level).level
    end

    unless student_achievement_with_maximum_level >= course_minimum_level
      errors.add(:student, "must have a achieved a minimum of #{Achievement.find(course.minimum_level).name}")
    end
  end
end
