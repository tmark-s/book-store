class AddColumnFreqTagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :freq_tag, :text
  end
end
