class Belt < ActiveRecord::Base
  has_many :achievements

  validates :name, :sequence, presence: true
end
