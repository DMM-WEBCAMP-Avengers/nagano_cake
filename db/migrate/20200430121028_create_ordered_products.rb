class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|

      t.integer :product_id
      t.integer :order_history_id
      t.integer :price
      t.integer :quantity
      t.integer :work_status, default:1

      t.timestamps null: false
    end

    add_index :ordered_products, :order_history_id
  end
end
