class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  belongs_to :order_histories
  belongs_to :destinations, dependent: :destroy
  belongs_to :cart_products, dependent: :destroy

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
