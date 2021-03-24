require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @room_user = FactoryBot.create(:room_user, user_id: @user.id, room_id: @room.id)
    @message = FactoryBot.build(:message)
  end

  context "メッセージ送信できる時" do
    it "メッセージを入力し、送信ボタンを押せばメッセージが一番上に表示される" do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを選択をクリック
      click_link "スレッドを選ぶ"
      # スレッドを選択
      click_link "#{@room.thread_name}"
      # 入力欄が有ることを確認
      find('textarea[name="content"]')
      # メッセージを入力
      fill_in 'send-input', with: "#{@message.content}"
      # 送信ボタンをクリックするとモデルのカウントが1上がる
      expect {
        find('input[name="commit"]').click
        sleep 0.3
      }.to change{Message.count}.by(1)
      # メッセージが表示される
      expect(page).to have_content("#{@message.content}")
    end
  end

  context "メッセージを送信できない時" do
    it "メッセージを入力せずに送信ボタンを押すとアラートが出て送信できない" do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを選択をクリック
      click_link "スレッドを選ぶ"
      # スレッドを選択
      click_link "#{@room.thread_name}"
      # 送信ボタンをクリックするとアラートが出るのでOKを押す
      find('input[name="commit"]').click
      page.accept_confirm("Please type a message")
      # メッセージが無いことを確認
      expect(page).to have_no_content("#{@message.content}")
    end
  end
end
