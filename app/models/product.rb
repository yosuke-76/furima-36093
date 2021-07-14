class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charg
  belongs_to :prefecture
  belongs_to :product_status
  belongs_to :shipping_day

  

end
