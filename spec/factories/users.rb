FactoryBot.define do
  factory :user do
    confirmed_at Time.now
    name { Faker::Name }
    email { Faker::Internet.email}
    password "please123"

    trait :admin do
      role 'admin'
    end
  end
end
