class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_to_ship


  with_options presence: true do
    validates :title 
    validates :instruction
    validates :image 

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id 
      validates :shipping_fee_id
      validates :prefecture_id
      validates :days_to_ship_id 
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    end
  end
end
