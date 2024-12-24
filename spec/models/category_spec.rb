require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end

  describe 'category新規登録' do
    context '新規登録できるとき' do
      it 'category, user_idが存在すれば新規登録できる' do
        expect(@category).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'categoryが空では登録できない' do
        @category.category = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Category can't be blank")
      end
      it 'user_idが紐づいていないと登録できない' do
        @category.user = nil
        @category.valid?
        expect(@category.errors.full_messages).to include("User must exist")
      end
    end
  end
end

