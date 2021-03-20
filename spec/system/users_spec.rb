require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # 新規登録ボタンが有ることを確認する
      expect(page).to have_content("新規登録")
      # 新規登録画面に遷移
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "ユーザー名", with: @user.username
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      fill_in "パスワード(確認用)", with: @user.password_confirmation
      # 登録ボタンを押すとユーザーモデルのカウントが１上がる
      expect {
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      # トップページに移動する
      expect(current_path).to eq(root_path)
      # ユーザー名とログアウトボタンが有ることを確認する
      expect(page).to have_content("#{@user.username}さん")
      expect(page).to have_content("ログアウト")
      # 新規登録やログインボタンがないことを確認する
      expect(page).to have_no_content("新規登録")
      expect(page).to have_no_content("ログイン")
    end
  end
end