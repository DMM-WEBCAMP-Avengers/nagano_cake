class OrderedProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order_history

    enum genre:{
        disable: 1,
        wait: 2,
        working: 3,
        done: 4
    }

    with_option presence: true do
        validates :product_id
        validates :order_history_id
        validates :price
        validates :quantity
        validates :work_status
    end

end
