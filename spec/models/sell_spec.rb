require 'rails_helper'

RSpec.describe Sell, type: :model do

  before do
    @sell = FactoryBot.build(:sell)
  end

  describe 'sell新規登録' do
    context '新規登録できるとき' do
      it 'transaction_date, total_price, user_id, customer_idが存在すれば新規登録できる' do
        expect(@sell).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'transaction_dateが空では登録できない' do
        @sell.transaction_date = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Transaction date can't be blank")
      end
      it 'total_priceが空では登録できない' do
        @sell.total_price = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Total price can't be blank")
      end
      it 'user_idが紐づいていないと登録できない' do
        @sell.user = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include("User must exist")
      end
      it 'customer_idが紐づいていないと登録できない' do
        @sell.customer = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Customer must exist")
      end
    end
  end
end

