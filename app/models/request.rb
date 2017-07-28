class Request < ApplicationRecord
  belongs_to :staff
  belongs_to :room
  
  before_create do
    self.id = [1000, self.class.maximum(:id)+1].max if self.id.nil?
  end
end
