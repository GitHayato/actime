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
  end
end
