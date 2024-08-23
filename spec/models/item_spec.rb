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
        expect(@item.errors.full_messages).to include('Price must be between 300 and 9,999,999')
      end
      it 'カテゴリーIDが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '状態IDが空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it '配送負担者IDが空では保存できない' do
        @item.delivery_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery payer is not a number')
      end
      it '配送エリアIDが空では保存できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area is not a number')
      end
      it 'リードタイムが空では保存できない' do
        @item.lead_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Lead time is not a number')
      end
    end
  end
end
