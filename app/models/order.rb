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

  def self.buy_count
    Order.all.each do |order|
      order.book.buy_amount += 1
      order.book.save
    end
  end

  def self.print_receipt(orders, current_user)
    datetime = DateTime.now
    datetime = datetime.strftime("%d-%m-%Y %H:%M")
    datetime = datetime.split(" ")
    Prawn::Document.generate("#{current_user.firstname}_#{current_user.lastname}_#{datetime[0]}_#{datetime[1]}.pdf") do |pdf|
      pdf.text "SALES RECEIPT", :align => :right, :size => 18
      pdf.move_down 10
      pdf.text "DATE/TIME : #{datetime[0]} #{datetime[1]}", :align => :right, :size => 10
      
      pdf.text "Book-store", :size => 12, :font_style => :bold
      pdf.text "address", :size => 8
      pdf.move_down 20

      pdf.text "Sold to", :size => 12, :font_style => :bold
      pdf.text "#{current_user.firstname} #{current_user.lastname}", :size => 8
      pdf.text orders.first.address, :size => 8
      pdf.move_down 20

      pdf.table [
        ["BOOK", "AMOUNT", "UNIT PRICE", "DISCOUNT", "LINE TOTAL"]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:align => :center, :size => 8, :font_style => :bold}
      orders.each do |order|
        pdf.table [
          [order.book.title, "1", order.book.price, "-", order.book.price]
        ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8}
      end

      
    end
  end
end