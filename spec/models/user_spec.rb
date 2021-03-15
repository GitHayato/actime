require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報' do
    context '新規登録できる' do
      it 'username, email, password, confirmationがすべてあるとき' do
        @user
        expect(@user).to be_valid
      end
    end
    context '新規登録できない' do
      it 'usernameがないとき' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ユーザー名を入力してください"
      end
      it 'emailがないとき' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it 'emailに＠や.が含まれていないとき' do
        @user.email = 'adminadmincom'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end
      it 'passwordがないとき' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'password_confirmationがないとき' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'passwordが6文字以上でないとき' do
        @user.password = 'admin'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません", "パスワードは6文字以上で入力してください"
      end
    end
  end
end
