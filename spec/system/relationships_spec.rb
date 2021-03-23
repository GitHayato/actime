require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
  end

  context "フォロー情報が保存されるとき" do
    it "フォローするとボタンが変わる" do
      # user1でログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user1.email
      fill_in "パスワード", with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 検索ボタンが有ることを確認
      expect(page).to have_button("検索")
      # user2を検索
      fill_in "keyword", with: "#{@user2.username}"
      click_button "検索"
      # 検索結果からuser2をクリック
      click_link "#{@user2.username}"
      # フォローするボタンが有ることを確認
      expect(page).to have_button("フォローする")
      # フォローボタンをクリックするとモデルのカウントが1上がる
      expect {
        click_button "フォローする"
        sleep 0.3
      }.to change {Relationship.count}.by(1)
      # フォロ−するボタンが無くなっていることを確認
      expect(page).to have_no_button("フォローする")
      # フォロー解除ボタンが有ることを確認
      expect(page).to have_button("フォローを外す")
    end

    it "フォロー解除するとボタンが変わる" do
      # user1 でログインする
      visit new_user_session_path
      fill_in "メールアドレス", with: @user1.email
      fill_in "パスワード", with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # user2を検索
      fill_in "keyword", with: "#{@user2.username}"
      click_button "検索"
      # 検索結果からuser2をクリック
      click_link "#{@user2.username}"
      # フォローする
      click_button "フォローする"
      # フォロー解除するとモデルのカウントが1下がる
      expect {
        click_button "フォローを外す"
        sleep 0.3
      }.to change {Relationship.count}.by(-1)
      # フォロー解除ボタンが無くなっていることを確認
      expect(page).to have_no_button("フォローを外す")
      # フォローするボタンが有ることを確認
      expect(page).to have_button("フォローする")
    end
  end
end