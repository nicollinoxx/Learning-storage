class AddShipdateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :ship_date, :datetime
  end
end
