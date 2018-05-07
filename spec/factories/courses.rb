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

FactoryBot.define do
  factory :course do
    name "MyString"
    start_date "2016-03-17"
    end_date "2016-03-17"
    description "MyText"
    max_students 1
  end
end
