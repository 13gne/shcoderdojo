FactoryBot.define do
  factory :course do
    name Faker::Educator.course
    start_date Faker::Date.backward(14)
    end_date Faker::Date.forward(23)
    description Faker::Hipster.paragraph
    max_students Faker::Number.between(15, 60)
    minimum_level nil

    factory :course_with_minimum_achievement do
      minimum_level 5
    end
  end
end
