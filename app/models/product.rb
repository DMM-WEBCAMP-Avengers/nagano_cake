class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products
  belongs_to :genre

  attachment :image

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :introduction
    validates :price
    validates :validation
  end
end
