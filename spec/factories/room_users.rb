FactoryBot.define do
  factory :room_user do
    user {FactoryBot.create(:user)}
    room {FactoryBot.create(:room)}
  end
end
