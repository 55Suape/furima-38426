FactoryBot.define do
  factory :order_address do
    user_id       { Faker::Number.non_zero_digit }
    item_id       { Faker::Number.non_zero_digit }
    post_code     { '020-0104' }
    prefecture_id { 2 }
    city          { '盛岡市' }
    house_number  { '1-1-1' }
    phone_number  { '09000000000' }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end