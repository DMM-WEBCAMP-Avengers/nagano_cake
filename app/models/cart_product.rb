class CartProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product

  with_options presence: true do |cp|
    cp.validates :user_id
    cp.validates :product_id
    cp.validates :quantity
  end

end
