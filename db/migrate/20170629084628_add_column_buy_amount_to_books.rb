class AddColumnBuyAmountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :buy_amount, :integer, default: 0
  end
end
