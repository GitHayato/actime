FactoryBot.define do
  factory :user do
    username               {'admin'}
    email                  {'admin@admin.com'}
    password               {'Admin123'}
    password_confirmation  {password}
    public_uid             {'1234abcd'}
  end
end