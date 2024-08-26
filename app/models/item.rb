class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  # ActiveHashの設定とアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_payer
  belongs_to :delivery_area
  belongs_to :lead_time

  # バリデーション
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_payer_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :lead_time_id, numericality: { other_than: 1 }
end
