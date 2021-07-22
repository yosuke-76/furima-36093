class ProductTag
  include ActiveModel::Model
  attr_accessor :product_name, :product_text, :category_id, :product_status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :price, :user_id, :name, :image

  with_options presence: true do
    validates :name
    validates :image
    validates :product_name
    validates :product_text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    with_options numericality: { greater_than: 299, less_than: 10000000 } do
      validates :price, format: { with: /\A[0-9]+\z/ }
    end
  end

  def save
    product = Product.create(product_name: product_name, product_text: product_text, category_id: category_id, product_status_id: product_status_id, delivery_charge_id: delivery_charge_id, prefecture_id: prefecture_id, shipping_day_id: shipping_day_id, price: price, user_id: user_id, image: image)
    tag = Tag.create(name: name)
    ProductTagRelation.create(product_id: product.id, tag_id: tag.id)
  end
end
