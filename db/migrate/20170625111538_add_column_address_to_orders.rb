class AddColumnAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :text
  end
end
