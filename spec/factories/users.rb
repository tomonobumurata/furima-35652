FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.middle_name }
    email                 { Faker::Internet.free_email }
    password              { 'test12' }
    password_confirmation { password }
    last_name             { '漢字ひらがなカタカナ' }
    first_name            { '漢字ひらがなカタカナ' }
    last_name_kana        { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end
