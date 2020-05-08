class Destination < ApplicationRecord

belongs_to :user

with_options presence: true do |d|
    d.validates :user_id
    d.validates :addressee
    d.validates :postal_code
    d.validates :address
end

#日本の郵便番号は必ず7桁らしいです。
validates :postal_code, format: { with: /\d{7}/}

end
