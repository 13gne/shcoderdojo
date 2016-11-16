# == Schema Information
#
# Table name: sessions
#
#  id           :integer          not null, primary key
#  course_id    :integer
#  session_date :datetime
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  end_time     :datetime
#

FactoryGirl.define do
  factory :session do
    course_id 1
    session_date "2016-04-05 16:33:43"
    notes "MyText"
  end
end
