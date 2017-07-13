class Staff < ApplicationRecord
	has_many :requests

validates :email, uniqueness: { scope: :email }	
end
