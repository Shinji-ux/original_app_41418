require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'item新規登録' do
    context '新規登録できるとき' do
      it 'item_name, unit, price, user_id, category_idが存在すれば新規登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'unitが空では登録できない' do
        @item.unit = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Unit can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'user_idが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'category_idが紐づいていないと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must exist")
      end
    end
  end
end

