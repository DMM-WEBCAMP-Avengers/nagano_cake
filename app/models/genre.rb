class Genre < ApplicationRecord

	has_many :products

	with_options presence: true do |g|
		g.validates :name
		g.validates :validation
	end

end
