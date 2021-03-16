require 'rails_helper'

RSpec.describe Watch, type: :model do
  before do
    @watch = FactoryBot.build(:watch)
  end

  describe 'タイム情報' do
    context 'タイムを保存' do
      it 'タイムを保存できるとき' do
        expect(@watch).to be_valid
      end
      it 'eventがなくても保存ができる' do
        @watch.event = ''
        expect(@watch).to be_valid
      end
      it 'distanceがなくても保存ができる' do
        @watch.distance = ''
        expect(@watch).to be_valid
      end
      it 'user_idがなくても保存ができる' do
        @watch.user_id = ''
        expect(@watch).to be_valid
      end
    end
  end
end