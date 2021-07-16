class RenameShipinngDayIdColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :shipinng_day_id, :shipping_day_id
  end
end