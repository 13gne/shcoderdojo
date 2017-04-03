# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  belongs_to :user
  has_many :course_registrations, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true

end
