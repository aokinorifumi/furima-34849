FactoryBot.define do
  factory :sale_street do
    postal_cord        { '000-0000' }
    prefecture_id      { 2 }
    area               { '北海道' }
    address            { '世田谷' }
    building_name      { '東京タワー' }
    phone_number       { '00000000000' }
    token              {"tok_abcdefghijk00000000000000000"}
    user_id            { 2 }
    item_id            { 2 }
  end
end