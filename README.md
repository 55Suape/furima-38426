# テーブル設計

## usersテーブル

| Column             | Type   | Options                           |
| ------------------ | ------ | --------------------------------- |
| nickname           | string | null: false                       |
| email              | string | null: false, unique: true         |
| encrypted_password | string | null: false                       |
| last_name          | string | null: false                       |
| first_name         | string | null: false                       |
| last_name_kana     | string | null: false                       |
| first_name_kana    | string | null: false                       |
| birth_year         | string | null: false                       |
| birth_month        | string | null: false                       |
| birth_date         | string | null: false                       |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null: false                   |
| spec               | text       | null: false                   |
| category           | string     | null: false                   |
| situation          | string     | null: false                   |
| shipping_fee       | string     | null: false                   |
| shipping_area      | string     | null: false                   |
| shipping_date      | string     | null: false                   |
| price              | string     | null: false                   |
| user_id            | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user_id            | references | null: false, foreign_key:true |
| item_id            | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル
| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null: false                   |
| prefecture         | string     | null: false                   |
| city               | string     | null: false                   |
| house_number       | string     | null: false                   |
| building_name      | string     | null: false                   |
| phone number       | string     | null: false                   |
| order_id           | references | null: false, foreign_key:true |

### Association

- belongs_to :order