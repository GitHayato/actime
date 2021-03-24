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
    context '保存できない' do
      it 'user_idがないとき' do
        @room_user.user_id = ''
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include "Userを入力してください"
      end
      it 'room_idがないとき' do
        @room_user.room_id = ''
        @room_user.valid? 
        expect(@room_user.errors.full_messages).to include "Roomを入力してください"
      end
    end
  end
end
