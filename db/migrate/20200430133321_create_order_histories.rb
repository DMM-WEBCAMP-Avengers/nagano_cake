class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :user_id
      t.string :addressee
      t.string :postal_code
      t.text :address
      t.integer :payment_option, default: 1
      t.integer :order_status, default: 1
      t.integer :postage, default: 800
      t.integer :billing

      t.timestamps
    end
  end
end
