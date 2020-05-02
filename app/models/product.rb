class Product < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :ordered_products
  belongs_to :genre

  attachment :image

  with_options presence: true do |p|
    p.validates :genre_id
    p.validates :name
    p.validates :introduction
    p.validates :price
    p.validates :validation
  end
end
