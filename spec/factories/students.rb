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

FactoryBot.define do
  factory :student do
    user
    name Faker::Name

    factory :student_with_user_and_high_achievement do
      after(:create) do |student|
        create(:high_student_achievement, student: student)
      end
    end
  end
end
