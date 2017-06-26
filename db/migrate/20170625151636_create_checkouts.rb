class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :address
    end
  end
end
