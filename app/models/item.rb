class Item < ApplicationRecord
  validates :item_name,presence: true
  validates :spec, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :schedule_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
