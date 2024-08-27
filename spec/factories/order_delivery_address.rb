FactoryBot.define do
  factory :order_delivery_address do
    postal_code { '123-4567' }
    delivery_area_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
