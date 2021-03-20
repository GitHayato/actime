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

    context '一意性の検証' do
      before do
        @relation = FactoryBot.create(:relationship)
        @relation2 = FactoryBot.build(:relationship)
      end
      it 'user_idが同じでもfollow_idが異なれば保存できる' do
        @relation.follow_id = @relation2.follow_id
        expect(@relation).to be_valid
      end
      it 'follow_idが同じでもuser_idが異なれば保存できる' do
        @relation.user_id = @relation2.user_id
        expect(@relation).to be_valid
      end
      it 'user_idとfollow_idの組み合わせは一意でなけば保存できない' do
        @relation2.user_id = @relation.user_id
        @relation2.follow_id = @relation.follow_id
        @relation2.valid?
        expect(@relation2.errors.full_messages).to include "Followはすでに存在します"
      end
    end
  end
end
