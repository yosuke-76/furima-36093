class CreatePurchaseLists < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
