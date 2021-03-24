require 'rails_helper'

RSpec.describe "スレッド", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room)
  end

  context "スレッドを作成できるとき" do
    it "正しい情報を入力すればスレッドが作成され、メッセージ投稿画面に遷移する" do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを作成が画面にあることを確認する
      expect(page).to have_content("スレッドを作成")
      # スレッド作成画面に遷移
      click_link "スレッドを作成"
      # 情報を入力する
      fill_in "スレッド名", with: @room.thread_name
      # 作成ボタンを押すとモデルのカウントが１つ上がる
      expect {
        find('input[name="commit"]').click
      }.to change {Room.count}.by(1)
      # メッセージ投稿画面に遷移する
      public_uid = current_path.split('/')[2]
      expect(current_path).to eq(room_messages_path(public_uid))
      # ルーム名があることを確認する
      expect(page).to have_content("#{@room.thread_name}")
    end
  end

  context "スレッドを作成できないとき" do
    it "スレッド名を入力しなければスレッドを作成できず、スレッド作成画面に戻る" do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを作成が画面にあることを確認する
      expect(page).to have_content("スレッドを作成")
      # スレッド作成画面に遷移
      click_link "スレッドを作成"
      # 情報を入力する
      fill_in "スレッド名", with: ""
      # 作成ボタンを押す
      find('input[name="commit"]').click
      # スレッド作成画面に戻る
      expect(current_path).to eq(rooms_path)
    end
  end
end
