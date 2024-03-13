FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    price {Faker::Number.between(from: 300, to:9999999)}
    number_of_day_id {Faker::Number.between(from:2, to: 4) }
    prefecture_id {Faker::Number.between(from:1, to: 47) }
    delivery_id {Faker::Number.between(from:2, to: 3) }
    condition_id {Faker::Number.between(from:2, to: 7) }
    category_id {Faker::Number.between(from:1, to: 10) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
