class Destination < ApplicationRecord

belongs_to :user

with_options presence: true do
    validate :user_id
    validate :addressee
    validate :postal_code
    validate :address
end

end
