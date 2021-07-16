class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :product_text, null: false
      t.integer :category_id, null: false
      t.integer :product_status_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipinng_day_id, null: false
      t.integer :price, null:false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
