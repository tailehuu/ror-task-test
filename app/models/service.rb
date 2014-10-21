class Service < ActiveRecord::Base
  attr_accessible :name
  has_many :payments
end
