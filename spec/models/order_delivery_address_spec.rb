require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
  end

  describe '寄付情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_delivery_address.building_name = ''
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含まない正しい形式でないと保存できないこと' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'delivery_area_idを選択していないと保存できないこと' do
        @order_delivery_address.delivery_area_id = 0
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Delivery area can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁未満では保存できないこと' do
        @order_delivery_address.phone_number = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end

      it '電話番号が11桁以上では保存できないこと' do
        @order_delivery_address.phone_number = '123456789111'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end

      it '番地が空では購入できないこと' do
        @order_delivery_address.street_number = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Street number can't be blank")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できないこと' do
        @order_delivery_address.phone_number = 'あ１023456789'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
