class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :order_status
      t.integer :postage
      t.integer :total_payment
      t.integer :pay_type
      t.timestamps
    end
  end
end
