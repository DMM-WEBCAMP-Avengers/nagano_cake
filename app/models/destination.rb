class Destination < ApplicationRecord

belongs_to :users

with_options presence: true do
    validate :user_id
    validate :adressee
    validate :postal_code
    validate :address
    validate :work_status
end

end
