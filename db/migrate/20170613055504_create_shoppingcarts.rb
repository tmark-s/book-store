class CreateShoppingcarts < ActiveRecord::Migration
  def change
    create_table :shoppingcarts do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end
end
