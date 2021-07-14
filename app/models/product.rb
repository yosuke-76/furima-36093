class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charg
  belongs_to :prefecture
  belongs_to :product_status
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :delivery_charg_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    with_options numericality: { greater_than: 300, less_than: 9999999 } do
      validates :price, format: { with: /\A[0-9]+\z/ }
    end
  end
end