class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :order_histories
  has_many :destinations, dependent: :destroy
  has_many :cart_products, dependent: :destroy

  
  with_options presence: true do |u|
    u.validates :first_name
    u.validates :last_name
    u.validates :kana_first_name
    u.validates :kana_last_name
    u.validates :postal_code
    u.validates :address
    u.validates :phone_number
  end

  validates :postal_code, format: { with: /\d{7}/} #日本の郵便番号は必ず7桁らしいです。
  validates :phone_number, format: { with: /\d{10,11}/} #日本の電話番号は必ず10か11桁らしいです。

	#boolean型はpresence: trueにしてしまうと、falseを空だと認識して弾かれてしまうので以下のように記述。
  validates :validation, inclusion:{in: [true, false]}

end
