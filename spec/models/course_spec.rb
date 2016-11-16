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

require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
