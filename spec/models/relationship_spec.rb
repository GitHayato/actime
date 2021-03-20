require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @relationship = FactoryBot.create(:relationship)
  end

  describe 'ユーザーの関係性' do
    context 'フォロー及びフォロー解除ができる' do
      it '中間テーブルに保存ができる' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォロー及びフォロー解除ができない' do
      it 'user_idがない' do
        @relationship.user_id = ""
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include "Userを入力してください"
      end
      it 'follow_idがない' do
        @relationship.follow_id = ""
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include "Followを入力してください"
      end
    end
  end
end
