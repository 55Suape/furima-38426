class Address < ApplicationRecord
  # 住所は1つの注文に紐づくので belongs_to :モデル単数形
  belongs_to :order
end
