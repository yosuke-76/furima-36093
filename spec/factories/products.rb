FactoryBot.define do
  factory :product do
    association :user
    product_name {'名前'}
    product_text {'説明'}
    category_id {2}
    product_status_id {2}
    delivery_charge_id {2}
    prefecture_id {2}
    shipping_day_id {2}
    price{ 333 }

    after(:build) do |product|
      product.image.attach(io: File.open('public/fixtures/test.png'), filename: 'test.png')
    end
  end
end