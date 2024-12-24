require 'rails_helper'

RSpec.describe Buy, type: :model do

  before do
    @buy = FactoryBot.build(:buy)
  end

  describe 'buy新規登録' do
    context '新規登録できるとき' do
      it 'transaction_date, user_id, supplier_idが存在すれば新規登録できる' do
        expect(@buy).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'transaction_dateが空では登録できない' do
        @buy.transaction_date = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Transaction date can't be blank")
      end
      it 'user_idが紐づいていないと登録できない' do
        @buy.user = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User must exist")
      end
      it 'supplier_idが紐づいていないと登録できない' do
        @buy.supplier = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Supplier must exist")
      end
    end
  end
end

