class Newwords < ActiveRecord::Base
  attr_accessible :ans, :category, :hint
  validates :ans, presence: true
	 validates :hint, presence: true
	 validates :category, presence: true
end
