FactoryBot.define do
  factory :order_address do
    post_code     { '020-0104' }
    prefecture_id { 2 }
    city          { '盛岡市' }
    house_number  { '1-1-1' }
    building_name { 'はなまるハイツ' }
    phone_number  { '09000000000' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
