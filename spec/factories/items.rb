FactoryBot.define do
  factory :item do
    item_name     { 'オリジナルフォトアルバム' }
    spec          { 'お気に入りの写真をまとめよう' }
    category_id   { 2 }
    condition_id  { 2 }
    postage_id    { 2 }
    prefecture_id { 2 }
    schedule_id   { 2 }
    price         { 1000 }

    association :user

    # ActiveStorageのテスト用
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
