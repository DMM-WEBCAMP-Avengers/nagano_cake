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
    u.validates :validation
  end

end
