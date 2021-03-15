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
  end
end
