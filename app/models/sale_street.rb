class SaleStreet
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :area, :address, :building_name, :phone_number, :sale_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :area
    validates :address
    validates :phone_number, length: { maximum: 11, message: "too long"}, format: {with: /\A[0-9]+\z/, message: "is invalid"}
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    sale = Sale.create(item_id: item_id, user_id: user_id)
    Street.create(postal_cord: postal_cord, prefecture_id: prefecture_id, area: area, address: address, building_name: building_name, phone_number: phone_number, sale_id: sale.id)
  end
end