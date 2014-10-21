class Payment < ActiveRecord::Base
  attr_accessible :line_item_id, :name, :service_id

  validates :service_id, :uniqueness => {:scope => :line_item_id}

  belongs_to :line_item
  belongs_to :service
end
