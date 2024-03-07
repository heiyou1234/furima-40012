FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"蓮"}
    last_name             {"陽翔"}
    first_name_kana       {"レン"}
    last_name_kana        {"ハルト"}
    birthday              {'1930-02-01'}
  end
end