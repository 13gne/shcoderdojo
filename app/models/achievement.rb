class Achievement < ActiveRecord::Base
  belongs_to :topic
  belongs_to :belt

  validates :topic_id, :belt_id, presence: true
end
