class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :order_histories
  has_many :destinations, dependent: :destroy
  has_many :cart_products, dependent: :destroy

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :kana_first_name
    validates :kana_last_name
    validates :postal_code
    validates :address
    validates :phone_number
    validates :validation
  end

end
