class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :making_status
      t.integer :tax_price
      t.integer :amount
      t.timestamps
    end
  end
end
