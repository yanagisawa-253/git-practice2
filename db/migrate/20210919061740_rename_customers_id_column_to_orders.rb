class RenameCustomersIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :customers_id, :customer_id
  end
end
