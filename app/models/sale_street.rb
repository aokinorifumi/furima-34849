class SaleStreet
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :area, :address, :building_name, :phone_number, :sale_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_cord
    validates :prefecture_id
    validates :area
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    sale = Sale.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Street.create(postal_cord: postal_cord, prefecture_id: prefecture_id, area: area, address: address, building_name: building_name, phone_number: phone_number, sale_id: sale.id)
  end
end