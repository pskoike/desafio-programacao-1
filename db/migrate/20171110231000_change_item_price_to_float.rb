class ChangeItemPriceToFloat < ActiveRecord::Migration[5.1]
  def change
     change_column :sales, :item_price, :float
  end
end
