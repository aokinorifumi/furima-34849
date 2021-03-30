FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aaa000' }
    password_confirmation { password }
    name_family_zen       { '阿笠' }
    name_first_zen        { '博士' }
    name_family_kana      { 'アガサ' }
    name_first_kana       { 'ヒロシ' }
    birth                 { '1930-01-01' }
  end
end
