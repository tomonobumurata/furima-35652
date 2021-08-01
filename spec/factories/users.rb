FactoryBot.define do
  factory :user do
    nickname {Faker::Name.middle_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    last_name_kana {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    birthday {Faker::Date.birthday}
  end
end