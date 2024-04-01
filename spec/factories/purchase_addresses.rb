FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { 6 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number{ '11111111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
