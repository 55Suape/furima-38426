class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # 住所は1つの注文に紐づくので has_one :モデル単数形
  has_one :address
end
