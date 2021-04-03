FactoryBot.define do
  factory :item do
    name               { '時計型麻酔銃' }
    text               { 'どこかにあるかも' }
    category_id        { 2 }
    status_id          { 2 }
    burden_id          { 2 }
    prefecture_id      { 2 }
    delivery_id        { 2 }
    price              { 9999999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
