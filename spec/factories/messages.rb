FactoryBot.define do
  factory :message do
    content {'Hello World!'}
    user {FactoryBot.create(:user)}
    room {FactoryBot.create(:room)}
  end
end
