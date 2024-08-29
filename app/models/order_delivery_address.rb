class OrderDeliveryAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :street_number, :building_name, :phone_number, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
    validates :token
  end
  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
  # validates :building_name

  def save
    # 注文情報を保存し、変数orderに代入する
    order = Order.create(user_id:, item_id:)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    DeliveryAddress.create(postal_code:, delivery_area_id:, city:, street_number:,
                           building_name:, phone_number:, order_id: order.id)
  end
end
