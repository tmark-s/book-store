class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :firstname
    	t.string :lastname
    	t.date :dateofbirth
    	t.text :address
    end
  end
end
