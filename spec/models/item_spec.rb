require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品出品情報が保存できる場合' do
      it '全ての条件がそろえば登録可能' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が保存できない場合' do
      it 'ユーザーが紐付いていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品名が空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it 'カテゴリーIDが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '状態IDが空では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送負担者IDが空では保存できない' do
        @item.delivery_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery payer must be other than 1')
      end
      it '配送エリアIDが空では保存できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it 'リードタイムが空では保存できない' do
        @item.lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Lead time must be other than 1')
      end
      it '画像が添付されていなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image can\'t be blank')
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can\'t be blank")
      end
      it '価格が半角数字以外の値が含まれている場合は保存できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10000000以上では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
