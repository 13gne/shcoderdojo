class Achievement < ActiveRecord::Base
  belongs_to :topic
  belongs_to :belt
  has_many :student_achievements, dependent: :destroy

  validates :topic_id, :belt_id, presence: true

  def name
    if self.id.nil?
      'None'
    else
      "#{self.topic.name} - #{self.belt.name} Belt"
    end
  end

  def level
    if self.id.nil?
      0
    else
      self.topic.sequence * 100 + self.belt.sequence
    end
  end
end
