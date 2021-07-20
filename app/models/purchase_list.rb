class PurchaseList < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :shipping_adress
end
