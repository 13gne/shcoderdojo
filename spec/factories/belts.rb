FactoryBot.define do
  factory :belt do
    name Faker::Color.color_name
    add_attribute(:sequence) { 1 }

    factory :belt_advanced do
      add_attribute(:sequence) { 10 }
    end
  end
end
