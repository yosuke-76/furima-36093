class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    purchase_list = PurchaseList.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create!(purchase_list_id: purchase_list.id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end 
end