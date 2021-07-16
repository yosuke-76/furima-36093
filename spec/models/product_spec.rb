require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '新規商品情報入力' do
    context '新規情報登録ができる時' do
      it '全ての情報が入力されていれば出品できること' do
        expect(@product).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it '商品名が空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品説明が空だと出品できない' do
        @product.product_text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product text can't be blank"
      end
      it 'カテゴリーが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の詳細が空だと出品できない' do
        @product.product_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Product status can't be blank"
      end
      it '配送料の負担の情報が空だと出品できない' do
        @product.delivery_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it '発送元の地域の情報が空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数の情報が空だと出品できない' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '価格の情報が空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が全角数字だと出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
      it '価格が設定範囲外だと出品できない' do
        @product.price = 10000001
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be less than 10000000"
      end
      it '価格が設定範囲外だと出品できない' do
        @product.price = 298
        @product.valid?
        expect(@product.errors.full_messages).to include "Price must be greater than 299"
      end
      it '画像が無いと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it '商品の状態の詳細が１だと出品できない' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Product status must be other than 1"
      end
      it '配送料の負担の情報が１だと出品できい' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery charge must be other than 1"
      end
      it '発送元の地域の情報が1だと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '発送までの日数の情報が1だと出品できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping day must be other than 1"
      end
      it 'カテゴリーが1だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品に紐づくユーザーがいなければ保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "User must exist"
      end
      it '価格が半角英数混合では登録できない' do
        @product.price = 'a1a1a1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
      it '価格が半角英語だけでは登録できない' do
        @product.price = 'aaaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
