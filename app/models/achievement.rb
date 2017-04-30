class Achievement < ActiveRecord::Base
  belongs_to :topic
  belongs_to :belt
  has_many :student_achievements, dependent: :destroy

  validates :topic_id, :belt_id, presence: true
end
