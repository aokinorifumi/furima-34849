require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'パスワードは、半角英数字混合6文字以上での入力が必須であること（passwordとpassword_confirmationが6文字以上であれば登録できる）' do
        @user.password = 'a0a0a0'
        @user.password_confirmation = 'a0a0a0'
        expect(@user).to be_valid
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること(名字と名前が入力されていれば登録できる)' do
        expect(@user).to be_valid
      end

      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.name_family_kana = 'アベ'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.name_first_kana = 'ユウジ'
        @user.valid?
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'sample.sample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること（5文字以下の場合、登録が出来ないこと）' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること（半角英字のみでは登録出来ないこと）' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること（半角数字のみでは登録出来ないこと）' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは全角では登録できないこと' do
        @user.password = '赤あかアカ紅'
        @user.password_confirmation = '赤あかアカ紅'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードは、確認用を含めて2回入力すること(パスワード確認用を入力しないと登録出来ないこと)' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードは、確認用を含めて2回入力すること(パスワード確認用が違う値だと登録出来ないこと)' do
        @user.password = '0a0a0a'
        @user.password_confirmation = '0b0b0b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること(名字が空欄なら登録出来ない)' do
        @user.name_family_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family zen can't be blank")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ必須であること(名前が空欄なら登録出来ない)' do
        @user.name_first_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first zen can't be blank")
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字に半角英数字が入ると登録出来ない)' do
        @user.name_family_zen = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family zen is invalid')
      end

      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前に半角英数字が入ると登録出来ない)' do
        @user.name_first_zen = 'ug'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first zen is invalid')
      end

      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名字が空だと登録出来ない)' do
        @user.name_family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name family kana can't be blank")
      end

      it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名前が空だと登録出来ない)' do
        @user.name_first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first kana can't be blank")
      end

      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること(半角英字だと登録出来ない)' do
        @user.name_family_kana = 'abe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family kana is invalid')
      end

      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること(漢字だと登録出来ない)' do
        @user.name_family_kana = '阿部'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family kana is invalid')
      end

      it 'ユーザー名字のフリガナは、全角（カタカナ）での入力が必須であること(ひらがなだと登録出来ない)' do
        @user.name_family_kana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name family kana is invalid')
      end

      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること(半角英字だと登録出来ない)' do
        @user.name_first_kana = 'ug'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first kana is invalid')
      end

      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること(漢字だと登録出来ない)' do
        @user.name_first_kana = '祐司'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first kana is invalid')
      end

      it 'ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること(ひらがなだと登録出来ない)' do
        @user.name_first_kana = 'ゆうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first kana is invalid')
      end

      it '生年月日が必須であること(生年月日が空だと登録出来ない)' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

      it '生年月日が必須であること(生まれ年が空だと登録出来ない)' do
        @user.birth = '01-02'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

      it '生年月日が必須であること(生まれ月が空だと登録出来ない)' do
        @user.birth = '1930-01'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

      it '生年月日が必須であること(生まれ日が空だと登録出来ない)' do
        @user.birth = '1930-02'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
