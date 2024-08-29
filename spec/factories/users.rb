FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 6)}1a" }
    password_confirmation { password }
    first_name            { '一郎' }
    last_name             { '鈴木' }
    first_name_kana       { 'イチロウ' }
    last_name_kana        { 'スズキ' }
    birth_date            { Faker::Date.birthday(min_age: 0, max_age: 120) }
  end
end
