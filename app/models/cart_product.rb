class CartProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :quantity
  end

end
