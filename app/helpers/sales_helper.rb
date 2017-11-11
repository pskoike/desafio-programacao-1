module SalesHelper

  def gr(sales)
    gr = 0
    sales.each do |sale|
      value = sale.item_price * sale.purchase_count.to_f
      gr += value
    end
    gr
  end
end
