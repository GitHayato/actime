FactoryBot.define do
  factory :user do
    username               {Faker::Name.name}
    email                  {Faker::Internet.email}
    password               {Faker::Internet.password(min_length: 8)}
    password_confirmation  {password}
    public_uid             {Faker::Number.hexadecimal(digits: 8)}
  end
end