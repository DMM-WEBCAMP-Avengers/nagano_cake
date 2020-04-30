class Destination < ApplicationRecord

belongs_to :user

with_options presence: true do
    validate :user_id
    validate :adressee
    validate :postal_code
    validate :address
end

end
