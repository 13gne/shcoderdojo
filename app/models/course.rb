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

class Course < ActiveRecord::Base
  has_many :course_registrations
  has_many :sessions

  validates :name, presence: true
  validates :description, presence: true
  validates :max_students, numericality: true
end
