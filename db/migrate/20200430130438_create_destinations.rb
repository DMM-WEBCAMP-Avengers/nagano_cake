class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|

      t.integer :user_id
      t.string :addressee
      t.string :postal_code
      t.text :address


      t.timestamps null:false
    end
    add_index :destinations, :user_id
  end
end
