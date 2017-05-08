class Belt < ActiveRecord::Base
  has_many :belts

  validates :name, :sequence, presence: true
end
