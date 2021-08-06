class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :title, :instruction, :image, :price, presence: true
  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 }
end
