class Newwordstable < ActiveRecord::Base
  attr_accessible :ans, :category, :hint, :status
  self.per_page = 5
end
