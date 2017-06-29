class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def self.freq_buy (current_user)
    freq = Hash.new
    current_user.orders.each do |order|
      order.book.tag_list.each do |tag|
        if freq[tag] != nil
          freq[tag] += 1
        else
          freq[tag] = 1
        end
      end
    end
    user = User.where(email: current_user.email).take
    if user.freq_tag != nil
      user.freq_tag = nil
      user.save
    end
    user.freq_tag = freq
    user.save
  end
end