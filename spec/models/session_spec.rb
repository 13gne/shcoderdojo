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

require 'rails_helper'

RSpec.describe Session, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
