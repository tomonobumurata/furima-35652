class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    # 数字3桁・ハイフン・数字4桁の並びのみ許可
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    # 10桁または11桁の数値のみ許可
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Adress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      record_id: record.id
    )
  end
end