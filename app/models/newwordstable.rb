class Newwordstable < ActiveRecord::Base
  attr_accessible :ans, :category, :hint, :status
   validates :ans, presence: true,uniqueness:true
	 validates :hint, presence: true
	 validates :category, presence: true
  self.per_page = 5
end
