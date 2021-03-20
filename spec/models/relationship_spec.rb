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
  end
end
