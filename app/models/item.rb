class Item < ApplicationRecord
  validates :item_name,presence: true
  validates :spec, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :schedule_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image

end
