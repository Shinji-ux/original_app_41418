require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe 'customer新規登録' do
    context '新規登録できるとき' do
      it 'company, phone, user_idが存在すれば新規登録できる' do
        expect(@customer).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'companyが空では登録できない' do
        @customer.company = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Company can't be blank")
      end
      it 'phoneが空では登録できない' do
        @customer.phone = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが9桁以下では登録できない' do
        @customer.phone = '090123456'
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが12桁以上では登録できない' do
        @customer.phone = '090123456789'
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'user_idが紐づいていないと登録できない' do
        @customer.user = nil
        @customer.valid?
        expect(@customer.errors.full_messages).to include("User must exist")
      end
    end
  end
end

