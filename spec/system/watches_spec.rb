require 'rails_helper'

RSpec.describe "ストップウォッチ", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @room_user = FactoryBot.create(:room_user, user_id: @user.id, room_id: @room.id)
    @watch = FactoryBot.build(:watch)
  end

  context "タイムが保存される時" do
    it 'STARTボタンを押し、LAPボタンを押すとラップタイムが表示される' do
      # ログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを選ぶをクリック
      click_link "スレッドを選ぶ"
      # スレッド名が有ることを確認
      expect(page).to have_link("#{@room.thread_name}")
      # スレッド名をクリック
      click_link "#{@room.thread_name}"
      # タイムを測るリンクが有ることを確認
      expect(page).to have_content("タイムを測る")
      # タイムを測るリンククリック
      click_link "タイムを測る"
      # STARTとLAPが有ることを確認
      expect(page).to have_button("START")
      expect(page).to have_button("LAP")
      # LAPはクラスにinactiveがあることを確認
      expect(page).to have_css '.inactive'
      # STARTをクリックするとSTARTがSTOPになり、STARTがなくなることを確認
      click_button "START"
      expect(page).to have_button("STOP")
      expect(page).to have_no_button("START")
      # LAPはクラスにinactiveがないことを確認
      expect(page).to have_no_css '.inactive'
      # １秒待つ
      sleep 1.0
      # LAPをクリックするとモデルのカウントが１上がる
      expect {
        click_button "LAP"
        sleep 0.3
      }.to change{Watch.count}.by(1)
      # "ページを更新してください"が有ることを確認
      expect(page).to have_content("ページを更新してください")
      # STOPをクリックするとRESETが有ることを確認
      click_button "STOP"
      expect(page).to have_button("RESET")
      # RESETをクリックするとタイムがリセットされることを確認
      click_button "RESET"
      expect(page).to have_content("00:00:00.000")
    end
    
    it 'タイム保存後に種目と距離を更新' do
      # ログイン
      visit new_user_session_path
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # スレッドを選ぶをクリック
      click_link "スレッドを選ぶ"
      # スレッド名をクリック
      click_link "#{@room.thread_name}"
      # タイムを測るリンククリック
      click_link "タイムを測る"
      # STARTをクリックを押して１秒待つ
      click_button "START"
      sleep 1.0
      # LAPをクリック
      click_button "LAP"
      # 種目をクリックして入力
      find('input[name="event"]').click
      fill_in "event", with: "#{@watch.event}"
      # 距離をクリックして入力
      find('input[name="distance"]').click
      fill_in "distance", with: "#{@watch.distance}"
      # STOPをクリック
      click_button "STOP"
      # ページをリロードすると、ページを更新してくださいがなくなることを確認
      visit current_path
      expect(page).to have_no_content("ページを更新してください")
      # 名前を選ぶ
      select @user.username, from: 'user_id'
      # ページを再リロードして名前と種目と距離が保存されていることを確認
      visit current_path
      expect(page).to have_select('user_id', selected: @user.username)
      expect(page).to have_field "event", with: "#{@watch.event}"
      expect(page).to have_field "distance", with: "#{@watch.distance}"
    end
  end
end
