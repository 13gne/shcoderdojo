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

require 'rails_helper'

RSpec.describe CourseRegistration, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
