FactoryBot.define do
  factory :watch do
    watch     {'00:00:00.000'}
    event     {'free style'}
    distance  {'100m'}
    user      {FactoryBot.create(:user)}
    room      {FactoryBot.create(:room)}
  end
end
