class HardWorker
  include Sidekiq::Worker

  def perform(orderid, userid)
    orders = Array.new
    orderid.each do |id|
      order = Checkout.where(id: id).take
      orders.push(order)
    end
    current_user = User.where(id: userid).take

    datetime = DateTime.now
    datetime = datetime.strftime("%d-%m-%Y %H:%M")
    datetime = datetime.split(" ")
    pdfname = "public/uploads/receipt/#{current_user.id}_#{current_user.firstname}_#{current_user.lastname}_#{datetime[0]}_#{datetime[1]}.pdf"
    
    Prawn::Document.generate(pdfname) do |pdf|
      pdf.text "SALES RECEIPT", :align => :right, :size => 18
      pdf.move_down 10
      pdf.text "DATE/TIME : #{datetime[0]} #{datetime[1]}", :align => :right, :size => 10
      
      pdf.text "Book-store", :size => 12, :font_style => :bold
      pdf.text "address", :size => 8
      pdf.move_down 20

      pdf.text "Customer", :size => 12, :font_style => :bold
      pdf.text "#{current_user.firstname} #{current_user.lastname}", :size => 8
      pdf.text orders.first.address, :size => 8
      pdf.move_down 20

      pdf.table [
        ["BOOK", "AMOUNT", "UNIT PRICE", "DISCOUNT", "LINE TOTAL"]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:align => :center, :size => 8, :font_style => :bold}
      total = 0
      orders.each do |order|
        pdf.table [
          [order.book.title, "1", order.book.price, "-", order.book.price]
        ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8}
        total += order.book.price
      end
      pdf.table [
        [nil, nil, "TOTAL DISCOUNT", "-", nil]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8, :font_style => :bold}
      pdf.table [
        [nil, nil, nil, "SUBTOTAL", total]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8, :font_style => :bold}
      vat = total/7
      vat = ActionController::Base.helpers.number_with_precision(vat, precision: 2).to_f
      pdf.table [
        [nil, nil, nil, "SALES TAX", vat]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8, :font_style => :bold}
      pdf.table [
        [nil, nil, nil, "TOTAL", ActionController::Base.helpers.number_with_precision(vat+total, precision: 2).to_f]
      ], :width => pdf.bounds.width, :column_widths => [220,80,80,80,80], :cell_style => {:size => 8, :font_style => :bold}
    end
    receipt = Receipt.new(user: current_user, bill: pdfname)
    receipt.save
    current_user.checkouts.each do |checkout|
      checkout.destroy
    end
  end
end
