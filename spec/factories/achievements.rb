FactoryBot.define do
  factory :achievement do
    topic
    belt

    factory :high_achievement do
      association :topic, factory: :topic_advanced
      association :belt, factory: :belt_advanced
    end
  end
end
