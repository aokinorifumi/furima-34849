require 'rails_helper'

RSpec.describe SaleStreet, type: :model do
  before do
    @sale_street = FactoryBot.build(:sale_street)
  end

  context '内容に問題ない場合' do
    it "記載内容を満たし、tokenがあれば保存ができること" do
      expect(@sale_street).to be_valid
    end

    it "建物名がなくとも登録できること" do
      @sale_street.building_name = nil
      @sale_street.valid?
      expect(@sale_street).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号がないと登録出来ない" do
      @sale_street.postal_cord = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Postal cord can't be blank")
    end

    it "郵便番号にハイフンがないと登録出来ない" do
      @sale_street.postal_cord = 0000000
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Postal cord is invalid. Include hyphen(-)")
    end

    it "都道府県が選ばれていないと登録出来ない" do
      @sale_street.prefecture_id = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村ないと登録出来ない" do
      @sale_street.area = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Area can't be blank")
    end

    it "住所がないと登録出来ない" do
      @sale_street.address = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号がないと登録出来ない" do
      @sale_street.phone_number = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @sale_street.token = nil
      @sale_street.valid?
      expect(@sale_street.errors.full_messages).to include("Token can't be blank")
    end
  end
end