class OrderedProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order_history

    enum genre:{
        disable: 1,
        wait: 2,
        working: 3,
        done: 4
    }

    with_options presence: true do |op|
        op.validates :product_id
        op.validates :order_history_id
        op.validates :price
        op.validates :quantity
        op.validates :work_status
    end

end
