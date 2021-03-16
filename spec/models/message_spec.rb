require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ情報' do
    context 'メッセージ送信' do
      it '送信できるとき' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージ送信できない' do
      it 'contentがないとき' do
        @message.content = ''
        @message.valid?
        expect(@message.errors.full_messages).to include "内容を入力してください"
      end
      it 'user_idがないとき' do
        @message.user_id = ''
        @message.valid?
        expect(@message.errors.full_messages).to include "Userを入力してください"
      end
      it 'room_idがないとき' do
        @message.room_id = ''
        @message.valid?
        expect(@message.errors.full_messages).to include "Roomを入力してください"
      end
    end
  end
end
