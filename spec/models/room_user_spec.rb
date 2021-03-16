require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  before do
    @room_user = FactoryBot.build(:room_user)
  end
end
