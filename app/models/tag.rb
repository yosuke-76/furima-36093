class Tag < ApplicationRecord
  has_many :product_tag_relations
  has_many :products, through: :product_tag_relations

  validates :name, uniqueness: true

  def self.search(search)
    if search != ""
      Tag.where(name: "#{search}")
    else
      redirect_to root_path
    end
  end
end