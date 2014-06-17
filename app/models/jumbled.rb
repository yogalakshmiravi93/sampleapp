class Jumbled < ActiveRecord::Base
	
  attr_accessible :ans, :category, :hint
	before_save { |jumbled| jumbled.ans = ans.upcase }
	 validates :ans, presence: true,uniqueness:true
	 validates :hint, presence: true
	 validates :category, presence: true
	 self.per_page = 5
end
