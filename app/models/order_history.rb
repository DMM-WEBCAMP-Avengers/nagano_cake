class OrderHistory < ApplicationRecord
	has_many :order_products
	belongs_to :user

	enum payment_option: {
		bank_transfer: 1,
		credit_card: 2
	}

	enum order_status: {
		unpaid: 1,
		paid: 2,
		working: 3,
		ready: 4,
		shipped: 5
	}

	with_options presence: true do |oh|
		oh.validates :user_id
		oh.validates :addressee
		oh.validates :postal_code
		oh.validates :address
		oh.validates :payment_option
		oh.validates :order_status
		oh.validates :postage
		oh.validates :billing
	end
end
