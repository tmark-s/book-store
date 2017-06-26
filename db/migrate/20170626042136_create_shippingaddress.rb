class CreateShippingaddress < ActiveRecord::Migration
  def change
    create_table :shippingaddresses do |t|
      t.integer :user_id
      t.text :address
    end
  end
end
