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
  end

	#boolean型はpresence: trueにしてしまうと、falseを空だと認識して弾かれてしまうので以下のように記述。
  validates :validation, inclusion:{in: [true, false]}

end
