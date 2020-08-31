require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録機能' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemailとpasswordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では存在できないこと' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'nicknameに一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Nickname has already been taken")
    end

    it 'emailに一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailは@を含んでいること' do
      @user.email = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordは6文字以上であること' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
