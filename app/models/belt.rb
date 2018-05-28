# == Schema Information
#
# Table name: belts
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  sequence   :integer
#  updated_at :datetime         not null
#

class Belt < ActiveRecord::Base
  has_many :achievements

  validates :name, :sequence, presence: true
end
