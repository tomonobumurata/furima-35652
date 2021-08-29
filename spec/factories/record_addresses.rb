FactoryBot.define do
  factory :record_address do
    token         { 'tok_abcdefghijk0000000000000000'}
    postal_code   { '123-4567'}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    house_number  { '1-1-1'}
    building_name { Faker::Address.community }
    phone_number  { Faker::Number.number(digits: 11) }

    association :user
    association :item
  end
end
