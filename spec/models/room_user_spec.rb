require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  before do
    @room_user = FactoryBot.build(:room_user)
  end
  describe '中間テーブル情報' do
    context '保存できる' do
      it '外部キーが適切に保存されるとき' do
        expect(@room_user).to be_valid
      end
    end
  end
end
