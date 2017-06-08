class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :categoryname
    end
  end
end
