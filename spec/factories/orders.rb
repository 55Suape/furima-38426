FactoryBot.define do
  factory :order do
    post_code     { '020-0104' }
    prefecture_id { 2 }
    city          { '盛岡市' }
    house_number  { '1-1-1' }
    phone_number  { '09000000000' }

    association :user,:item
  end
end
