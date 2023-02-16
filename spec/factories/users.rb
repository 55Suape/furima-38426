FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"佐藤"}
    first_name            {"春菜"}
    last_name_kana        {"サトウ"}
    first_name_kana       {"ハルナ"}
    birth_date            {"11111111"}
  end
end