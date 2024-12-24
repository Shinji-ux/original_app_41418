require 'rails_helper'

RSpec.describe Supplier, type: :model do
  before do
    @supplier = FactoryBot.build(:supplier)
  end

  describe 'supplier新規登録' do
    context '新規登録できるとき' do
      it 'company, phone, user_idが存在すれば新規登録できる' do
        expect(@supplier).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'companyが空では登録できない' do
        @supplier.company = ''
        @supplier.valid?
        expect(@supplier.errors.full_messages).to include("Company can't be blank")
      end
      it 'phoneが空では登録できない' do
        @supplier.phone = ''
        @supplier.valid?
        expect(@supplier.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが9桁以下では登録できない' do
        @supplier.phone = '090123456'
        @supplier.valid?
        expect(@supplier.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが12桁以上では登録できない' do
        @supplier.phone = '090123456789'
        @supplier.valid?
        expect(@supplier.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'user_idが紐づいていないと登録できない' do
        @supplier.user = nil
        @supplier.valid?
        expect(@supplier.errors.full_messages).to include("User must exist")
      end
    end
  end
end

