require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性である事' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、＠を含む必要がある事' do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須である事' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが半角英数字混合での入力が必須であること' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが6文字以上での入力が必須であること' do
      @user.password = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが全角では登録できないこと' do
      @user.password = '１２３４５６'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが英字のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、確認用も含めて２回入力すること,パスワードとパスワード(確認用)、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は名字が必須である事' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'ユーザー本名は名前が必須である事' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は名字が全角である事' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'ユーザー本名は名前が全角である事' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'ユーザー本名のフリガナは名字が必須である事' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは名前が必須である事' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー本名のフリガナ（名字）は全角（カタカナ）が必須である事' do
      @user.family_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'ユーザー本名のフリガナ（名前）は全角（カタカナ）が必須である事' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が必須である事' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
