FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence } # 商品名
    item_description { Faker::Lorem.paragraph } # 商品の説明（長めのテキスト）
    price { Faker::Commerce.price(range: 300..9_999_999) } # 価格（数値）
    category_id { Faker::Number.between(from: 2, to: 9) } # カテゴリーID（1桁または2桁の整数）
    condition_id { Faker::Number.between(from: 2, to: 9) } # 状態ID（1桁または2桁の整数）
    delivery_payer_id { Faker::Number.between(from: 2, to: 9) } # 配送負担者ID（1桁または2桁の整数）
    delivery_area_id { Faker::Number.between(from: 2, to: 48) } # 配送エリアID（1桁または2桁の整数）
    lead_time_id { Faker::Number.between(from: 2, to: 9) } # 発送までのリードタイム
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
