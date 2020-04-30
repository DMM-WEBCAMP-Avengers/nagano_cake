class Genre < ApplicationRecord

	has_many :products

	with_options presence: true do
		validates :name
		validates :validation
	end

end
