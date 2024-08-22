class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # ActiveHashの設定とアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_payer
  belongs_to :delivery_area
  belongs_to :lead_time
end
