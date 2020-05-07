class OrderedProduct < ApplicationRecord
    belongs_to :product
    belongs_to :order_history

    enum work_status:{
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

    def subtotal
        self.quantity * self.price
    end

    #ここはかなり見づらくなってしまいました。すみません。
    def auto_update_order_status
        parent_order_history = self.order_history
        brothers_ordered_products = parent_order_history.ordered_products
        brothers_work_statuses = brothers_ordered_products.map{ |op| op.work_status_before_type_cast }
        #所属する注文履歴に紐づく注文商品の製作ステータスに1つでも「製作中」が有れば親注文履歴の注文ステータスを「製作中」に。
        if  brothers_work_statuses.include?(3)
            parent_order_history.update(order_status: 3)
        #所属する注文履歴に紐づく注文商品の製作ステータスが全て「製作完了」なら親注文履歴の注文ステータスを「発送準備中」に。
        elsif brothers_work_statuses.all?{ |ws| ws == 4 }
            parent_order_history.update(order_status: 4)
        end
    end

end