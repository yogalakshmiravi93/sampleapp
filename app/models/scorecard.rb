class Scorecard < ActiveRecord::Base
  belongs_to :user
  attr_accessible :fruit, :vegetable
end
