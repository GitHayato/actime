require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'スレッド情報'　do
    context 'スレッドを作成できる' do
      it 'スレッド名があるとき' do
        @room
        expect(@room).to be_valid
      end
    end
  end
end
