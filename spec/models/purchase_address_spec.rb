require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '発送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '発送情報が登録できるとき' do
      it '全ての情報が正しく入力されていること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも登録ができること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '発送先情報が登録できない時' do
      it 'postal_codeが空だと登録できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeはハイフンが無いと登録できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeは半角で無いと登録できないこと' do
        @purchase_address.postal_code = '１２３−４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeは3桁ハイフン４桁出ないと登録できないこと' do
        @purchase_address.postal_code = '12-34567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefecture_idは空だと登録できないこと' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idは1だと登録できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'municipalityは空だと登録できないこと' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では登録できないこと' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberは空では登録できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは10桁以上11桁以内で無いと登録できないこと' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは全角だと登録できないこと' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberはハイフンがあると登録できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
      it '発送先情報に紐づくユーザーがいなければ登録できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "User can't be blank"
      end
      it '発送先情報に紐づく商品がなければ登録できないこと' do
        @purchase_address.product_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Product can't be blank"
      end
      it 'tokenが空だと登録できないこt' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'phone_numberは英数字混合では登録できないこと' do
        @purchase_address.phone_number = '090-1a1a-2b2b'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
      end
    end
  end
end