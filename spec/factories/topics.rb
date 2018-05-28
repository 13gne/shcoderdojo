FactoryBot.define do
  factory :topic do
    name Faker::Company.buzzword
    add_attribute(:sequence) { 1 }

    factory :topic_advanced do
      add_attribute(:sequence) { 10 }
    end
  end
end
