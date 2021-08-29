require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入ができるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@record_address).to be_valid
      end

      it 'building_numberは空でも購入できる' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'tokenが空では購入できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idを選択していないと購入できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空では購入できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postal_codeにハイフンがない場合は購入できない' do
        @record_address.postal_code = '12345678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code input correctly")
      end

      it 'phone_numberは10桁または11桁でない場合は購入できない' do
        @record_address.phone_number = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number input only number")
      end

      it 'phone_numberが数値でない場合は購入できない' do
        @record_address.phone_number = 'onetwothreefour'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number input only number")
      end
    end
  end
end
