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

FactoryBot.define do
  factory :course_registration do
    user_id 1
    student_id 1
    course_id 1
  end
end
