class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_list
  has_many :product_tag_relations
  has_many :tags, through: :product_tag_relations
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :product_status
  belongs_to :shipping_day

end