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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが存在してもpassword_confirmationが空では存在できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'nicknameに一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.nickname = @user.nickname
      another_user.valid?
      expect(another_user.errors.full_messages).to include('ニックネームはすでに存在します')
    end

    it 'emailに一意性があること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'emailは@を含んでいること' do
      @user.email = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end

    it 'passwordは6文字以上であること' do
      @user.password = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
  end
end
