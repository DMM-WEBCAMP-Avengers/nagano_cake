class OrderHistory < ApplicationRecord
  attr_accessor :radio_number, :destination_id

	has_many :ordered_products
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

	def auto_update_work_status
		#注文ステータスが「入金確認」になったら注文商品の製作ステータスを全て「製作待ち」に。
		if self.order_status_before_type_cast == 2
			self.ordered_products.each do |op|
				op.update(work_status: 2)
			end
		end
	end
end
