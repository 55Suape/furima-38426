class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :spec, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :schedule_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999, allow_blank: true }
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :schedule
  has_one_attached :image
end
