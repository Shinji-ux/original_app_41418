require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user新規登録' do
    context '新規登録できるとき' do
      it 'email, password, password_confirmation, company, phoneが存在すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'companyが空では登録できない' do
        @user.company = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Company can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'phoneが空では登録できない' do
        @user.phone = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが9桁以下では登録できない' do
        @user.phone = '090123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'phoneが12桁以上では登録できない' do
        @user.phone = '090123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone must be a valid phone number")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it 'passwordが7文字以下では登録できない' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abcd1234'
        @user.password_confirmation = 'abcd12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
