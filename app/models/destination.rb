class Destination < ApplicationRecord

    belongs_to :user

    with_options presence: true do |d|
        d.validates :user_id
        d.validates :addressee
        d.validates :postal_code
        d.validates :address
    end

    def view_destination
        "#{self.postal_code} #{self.address} #{self.addressee}"
    end

end
