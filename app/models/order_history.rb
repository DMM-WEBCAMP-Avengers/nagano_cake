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

	with_options presence: true do
		validates :user_id
		validates :addressee
		validates :postal_code
		validates :address
		validates :payment_option
		validates :order_status
		validates :postage
		validates :billing
	end
end
