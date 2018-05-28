FactoryBot.define do
  factory :student_achievement do
    student
    achievement

    factory :high_student_achievement do
      association :achievement, factory: :high_achievement
    end
  end
end
